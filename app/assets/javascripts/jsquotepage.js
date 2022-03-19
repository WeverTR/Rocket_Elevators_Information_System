
const inputsElementIds = [ 'number-of-apartments',
'number-of-floors',
'number-of-basements',
'number-of-companies',
'number-of-parking-spots',
'number-of-elevators',
'number-of-corporations',
'maximum-occupancy',
'business-hours',
'elevator-amount', //read only
'column-amount' //read only
];

const buildingTypes = {
	commercial: ["number-of-floors", "number-of-basements","number-of-companies", "number-of-parking-spots", "number-of-elevators", "elevator-amount"],
	residential: ["number-of-apartments", "number-of-floors", "number-of-basements", "elevator-amount", "column-amount"],
	corporate: ["number-of-floors", "number-of-basements","number-of-parking-spots", "number-of-corporations", "maximum-occupancy", "elevator-amount", "column-amount"],
	hybrid: ["number-of-floors", "number-of-basements", "number-of-companies", "number-of-parking-spots", "maximum-occupancy", "business-hours", "elevator-amount", "column-amount"]
};

//this will be updated
let inputValues = {}


function hideElementIds(elementIds)
{
	for(i=0; i<elementIds.length; i++)
	{
		$("#"+elementIds[i]).hide()
	}
}

function showElementIds(elementIds)
{
	for(i=0; i<elementIds.length; i++)
	{
		$("#"+elementIds[i]).show()
	}
}

function lookForTagInElement(element, tag)
{
	let contents = element.children();
	for(let i=0; i<contents.length; i++)
	{
		let element2 = contents[i];
		if(element2.nodeName.toLowerCase() === tag)
		{
			return element2;
		}
	}
}

let selectedBuilding = "residential";

function getSelectedBuilding() {
	return buildingTypes[selectedBuilding];
}

function calculateAmountOfColumns()
{
	switch(selectedBuilding) 
	{
		case "commercial":
			return 0;
		case "residential":
			let floors = Number(inputValues["number-of-floors"].value);
			let columns = Math.round(floors / 20);
			return columns;
	}
	if(selectedBuilding == "hybrid" || selectedBuilding == "corporate")
	{
		let floors = Number(inputValues["number-of-floors"].value);
		let basements = Number(inputValues["number-of-basements"].value);

		let columns = Math.round((floors + basements) / 20);
		return columns;
	}
	return 0;
}

function calculateAmountOfLifts()
{
	switch(selectedBuilding) 
	{
		case "commercial":
			// the number of elevator shafts to be deployed is specified and the estimated number of cages is equal to the number required.
			return inputValues["number-of-elevators"].value;
		case "residential":
			let apartments = Number(inputValues["number-of-apartments"].value);
			let floors = Number(inputValues["number-of-floors"].value);
			let basements = Number(inputValues["number-of-basements"].value);

			let avgdoorsperfloor = apartments / floors;
			let shafts = avgdoorsperfloor / 6;
			
			let additional = (floors / 20);
			while(additional > 1)
			{
				shafts *= 2;
				additional -= 1;
			}
			
			shafts = Math.ceil(shafts);
			return shafts;
	}
	if(selectedBuilding == "hybrid" || selectedBuilding == "corporate")
	{
		let floors = Number(inputValues["number-of-floors"].value);
		let basements = Number(inputValues["number-of-basements"].value);
		let occupancy = Number(inputValues["maximum-occupancy"].value);

		let occupants = occupancy * (floors + basements);
		let elevators = occupants / 1000;
		let columns = Math.round((floors + basements) / 20);
		let elevatorsPerColumn = Math.round(elevators / columns);
		let finalAmountElevators = Math.round(elevatorsPerColumn * columns);
		if(finalAmountElevators.toString() === "NaN")
			return 1;
		return finalAmountElevators;
	}
	return 0;
}

// 1= standard
// 2= premium
// 3= excelium
function getProductLine()
{
	if(document.getElementById("standard").checked)
	{
		return "standard";
	}
	else if(document.getElementById("premium").checked)
	{
		return "premium";
	}
	else if(document.getElementById("excelium").checked)
	{
		return "excelium";
	}
	return "none";
}

function calculateUnitPrice()
{
	let productline = getProductLine();
	switch(productline)
	{
		case "standard":
			return 7565;
		case "premium":
			return 12345;
		case "excelium":
			return 15400;
	}
	//how would the runtime even reach here??
	return 0;
}

function getInstallationFeesMultiplier()
{
	let productline = getProductLine();
	switch(productline)
	{
		case "standard":
			return 1.1;
		case "premium":
			return 1.13;
		case "excelium":
			return 1.16;
	}
	return 1;
}

function calculateInstallationPrice()
{
	let totalPrice = calculateElevatorTotalPrice();
	let installscale = getInstallationFeesMultiplier();
	return totalPrice * Math.max(installscale - 1, 0);
}

function calculateElevatorTotalPrice()
{
	let amountOfLifts = calculateAmountOfLifts();
	let unitPrice = calculateUnitPrice();
	
	return (unitPrice * amountOfLifts);
}

function calculateTotalPrice()
{
	let elevatorTotalPrice = calculateElevatorTotalPrice();
	
	return elevatorTotalPrice * getInstallationFeesMultiplier();
}

let mf = new Intl.NumberFormat('en-CA', {style: 'currency',currency: 'CAD'});

function setInputValue(id, v)
{
	lookForTagInElement($(id), "input").value = v;
}

function setPriceValue(id, number)
{
	let validation = number;
	if(validation === Infinity)
	{
		validation = 0;
	}
	validation = Math.max(0, validation);

	setInputValue(id, mf.format(validation).toString());
}

function UpdatePricing()
{
	setInputValue("#elevator-amount", calculateAmountOfLifts());
	setInputValue("#column-amount", calculateAmountOfColumns());
	setPriceValue("#elevator-unit-price", calculateUnitPrice());
	setPriceValue("#elevator-total-price", calculateElevatorTotalPrice());
	setPriceValue("#installation-fees", calculateInstallationPrice());
	setPriceValue("#final-price", calculateTotalPrice());
}

function OnChanged()
{
	UpdatePricing();
}

const elementsToBind = [ 
	'#building-type',
	'#residential',
	'#commercial',
	'#corporate',
	'#hybrid',
	'#number-of-apartments',
	'#number-of-floors',
	'#number-of-basements',
	'#number-of-companies',
	'#number-of-parking-spots',
	'#number-of-elevators',
	'#number-of-corporations',
	'#maximum-occupancy',
	'#business-hours',
	"#standard",
	"#premium",
	"#excelium",
];

function bindElements()
{
	for(let i=0; i<elementsToBind.length; i++)
	{
		$(elementsToBind[i]).on("change", 
			function()
			{
				OnChanged();
			}
		);
	}
}

//init js
function OnReady()
{
	$("#building-type").on("change", function()
		{
			selectedBuilding = this.value;
			hideElementIds(inputsElementIds);
			showElementIds(buildingTypes[this.value]);
		}
	)
	
	selectedBuilding = $("#building-type").find("option:selected").attr("id");

	hideElementIds(inputsElementIds);
	showElementIds(buildingTypes[selectedBuilding]);
	
	for(let i=0; i<inputsElementIds.length; i++)
	{
		let id = inputsElementIds[i];
		inputValues[id] = $("#"+id).find("input")[0];
	}
	
	bindElements();
}

$(document).ready(OnReady)



// quote sumbitting

//testing purposes
function fieldarefilled() {
	let currentBuildingType = buildingTypes[selectedBuilding]
	if(!selectedBuilding)
		return false;
	for(i=0; i<currentBuildingType; i++)
	{
		if(inputValues[currentBuildingType[i]].value == null)
		{
			return false
		}
	}

	return true
};

function sumbitquote() {
	if(!fieldarefilled())
		return;
	$.ajax({
		url:'/quotes/create',
		type:'POST',
		dataType:'json',
		data:{
			quote:{
				BuildingType: selectedBuilding,
				NumberOfFloors: inputValues["number-of-floors"].value,
				NumberOfBasements: inputValues["number-of-basements"].value,
				NumberOfcompanies: inputValues["number-of-companies"].value,
				NumberOfParkingSpots: inputValues["number-of-parking-spots"].value,
				NumberOfElevators: inputValues["number-of-elevators"].value,
				NumberOfApartments: inputValues["number-of-apartments"].value,
				NumberOfCorporations: inputValues["number-of-corporations"].value,
				NumberOfOccupany: inputValues["maximum-occupancy"].value,
				NumberOfBusinessHours: inputValues["business-hours"].value,
				ElevatorAmount: inputValues["elevator-amount"].value,
				ColumnAmount: inputValues["column-amount"].value,
				ProductLine: getProductLine(),
				ElevatorUnitCost: calculateUnitPrice(),
				ElevatorTotalCost: calculateElevatorTotalPrice(),
				InstallationCost: calculateInstallationPrice(),
				TotalPrice: calculateTotalPrice()
			},
			authenticity_token: window._token
		},
		success:function(data){
			alert("success!!!")
			console.log(data)
		},
		error:function(data){
			alert("failed!!!")
			console.log(data)
		}
	});
};

$("#sumbit-quote").on("click", sumbitquote)


window.onload = () => elevatorUnitPrice()
 
let buildingType;

$("#building-type").change(pick)

function pick() {
    if ($("#building-type").val() === "residential") {
       buildingType = "residential"
       document.getElementById ("elevatorForm").reset();
       document.getElementById ("outputForm").reset();
       
        $("#number-of-apartments").css("display", "block");
        $("#number-of-basements").css("display", "block");
        $("#number-of-floors").css("display", "block");
        $("#number-of-parking-spots").css("display", "none");
        $("#number-of-companies").css("display", "none");
        $("#number-of-elevators").css("display", "none");
        $("#maximum-occupancy").css("display", "none");
        $("#business-hours").css("display", "none");
        $("#number-of-corporations").css("display", "none");
        

    }else if ($("#building-type").val() === "commercial") {
        buildingType = "commercial"
        document.getElementById ("elevatorForm").reset ();
        document.getElementById ("outputForm").reset();
        $("#number-of-apartments").css("display", "none");
        $("#number-of-floors").css("display", "block");
        $("#number-of-basements").css("display", "block");
        $("#number-of-companies").css("display", "block");
        $("#number-of-parking-spots").css("display", "block");
        $("#number-of-elevators").css("display", "block");
        $("#maximum-occupancy").css("display", "none");
        $("#business-hours").css("display", "none");
        $("#number-of-corporations").css("display", "none");
      

    }else if ($("#building-type").val() === "corporate") {
        buildingType = "corporate"
        document.getElementById ("elevatorForm").reset ();
        document.getElementById ("outputForm").reset();
        $("#number-of-apartments").css("display", "none");
        $("#number-of-floors").css("display", "block");
        $("#number-of-basements").css("display", "block");
        $("#number-of-companies").css("display", "none");
        $("#number-of-parking-spots").css("display", "block");
        $("#number-of-elevators").css("display", "none");
        $("#maximum-occupancy").css("display", "block");
        $("#number-of-corporations").css("display", "block");
        $("#business-hours").css("display", "none");
        

    }else if ($("#building-type").val() === "hybrid") {
        buildingType = "hybrid"
        document.getElementById ("elevatorForm").reset ();
        document.getElementById ("outputForm").reset();
        $("#number-of-apartments").css("display", "none");
        $("#number-of-floors").css("display", "block");
        $("#number-of-basements").css("display", "block");
        $("#number-of-companies").css("display", "block");
        $("#number-of-parking-spots").css("display", "block");
        $("#number-of-elevators").css("display", "none");
        $("#maximum-occupancy").css("display", "block");
        $("#business-hours").css("display", "block");
        
    }

    $("#number-of-apartments").on("input", update)
    $("#number-of-floors").on("input", update)
    $("#number-of-basements").on("input", update)
    $("#number-of-elevators").on("input", update)
    $("#maximum-occupancy").on("input", update)
}

let outputValues = {
    elevatorsRequired: 5,
    columnsRequired: 1,
    unitPrice: 1,
    installationCosts: 1,
    finalPrice: 1
}

let cages;

let liftCage = {
    "standard": 7565,
    "premium": 12345,
    "excelium": 15400
}


let installFees = {
    "standard": .10,
    "premium": .13,
    "excelium": .16
}

function update() {
    if ($("#building-type").val() === "residential") {
        
        
        let numOfApts = $("#numofapt").val()

        let numOfFloors = $("#numoffloors").val()
        
        if (numOfApts <= 0 || numOfFloors <= 0) {
            return; 
        }
       
        let avgDoorsPerFloor = Math.ceil(numOfApts / numOfFloors) 
        
        let elevatorShaftsRequired = Math.ceil(avgDoorsPerFloor / 6)
        
        let columnsRequired = Math.ceil(numOfFloors / 20) 

        outputValues.elevatorsRequired = elevatorShaftsRequired * columnsRequired
        console.log(outputValues.elevatorsRequired)

    } else if ($("#building-type").val() === "commercial") {
        
            let elevatorNum = $("#numofelev").val()
        
        if (elevatorNum <= 0) {
            return; 
        }

        
        
        outputValues.elevatorsRequired = elevatorNum
    

    } else if ($("#building-type").val() === "corporate" || $("#building-type").val() === "hybrid") {
       
        let occupantsPerFloor = $("#maxocc").val()
        
        let numOfFloors = $("#numoffloors").val()
        
        let numOfBasements = $("#numofbase").val()

        
        if (occupantsPerFloor <= 0 || numOfFloors <= 0 || numOfBasements <= 0) {
            return; 
        }

        
        let totalNumOfOccupants = occupantsPerFloor * (Number(numOfFloors) + Number(numOfBasements))
        
        let elevatorShaftsRequired = Math.ceil(totalNumOfOccupants / 1000)
        
        let columnsRequired = Math.ceil((Number(numOfFloors) + Number(numOfBasements)) / 20)
       
        let elevatorsPerColumn = Math.ceil(elevatorShaftsRequired / columnsRequired)
       
        elevatorsRequired = elevatorsPerColumn * columnsRequired
       
    }
    elevatorUnitPrice()
    displayResults(outputValues)
}

function elevatorsNeeded() {
    
}

function elevatorUnitPrice() {
  
    $("input[name=liftCage]").each(function () {
       if ($(this).is(':checked')) {
           cage = $(this).val()
        
       }
    })
}

function displayResults(outputValues) {
    
     
    // Display the recommended number of elevators
    $("#elevatorNum").val(outputValues.elevatorsRequired)
    console.log(outputValues.elevatorsRequired)

    // Display the unit price of an elevator
    $("#unitPrice").val(`$${liftCage[cage].toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the total price of the elevators
    $("#totalPriceElevators").val(`$${(outputValues.elevatorsRequired * liftCage[cage]).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the installation fees
    let totalPrice = outputValues.elevatorsRequired * liftCage[cage]
    $("#installFees").val(`$${(totalPrice * installFees[cage]).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the final total price including fees
    let installFee = totalPrice * installFees[cage]
    $("#totalPrice").val(`$${(totalPrice + installFee).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)
}