var documentready = function(){
    start()
}
$(document). on('turbolinks:load',  documentready); 

const buildingTypes = {
	commercial: ["number-of-floors", "number-of-basements","number-of-companies", "number-of-parking-spots", "number-of-elevators", "elevator-amount"],
	residential: ["number-of-apartments", "number-of-floors", "number-of-basements", "elevator-amount", "column-amount"],
	corporate: ["number-of-floors", "number-of-basements","number-of-parking-spots", "number-of-corporations", "maximum-occupancy", "elevator-amount", "column-amount"],
	hybrid: ["number-of-floors", "number-of-basements", "number-of-companies", "number-of-parking-spots", "maximum-occupancy", "business-hours", "elevator-amount", "column-amount"]
};

let installFees = {
    "standard": .10,
    "premium": .13,
    "excelium": .16
}

let liftCage = {
    "standard": 7565,
    "premium": 12345,
    "excelium": 15400
}

let cages;

let outputValues = {
    "elevatorsRequired": 1,
    "columnsRequired": 1,
    "unitPrice": 1,
    "installationCosts:": 1,
    "finalPrice": 1
}

function start() {
    $("#building-type").change(ChooseType)
}

function update() {
    
    elevatorsNeeded()
    elevatorUnitPrice()
    displayResults()
}

function elevatorsNeeded() {
    
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
        console.log(elevatorsRequired)

    } else if ($("#building-type").val() == "commercial") {
        
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
}

function elevatorUnitPrice() {
  
    $("input[name=liftCage]").each(function () {
       if ($(this).is(':checked')) {
           cage = $(this).val()
        
       }
    })
}


function ChooseType() {
    if ($("#building-type").val() === "residential") {
       buildType = "res"
        

    }else if ($("#building-type").val() === "commercial") {
        console.log("com")
        buildType = "com"
      

    }else if ($("#building-type").val() === "corporate") {
        console.log("corp")
        buildType = "corp"
        

    }else if ($("#building-type").val() === "hybrid") {
        console.log("hyb")
        buildType = "hyb"
        
    }

    ShowInputs(buildType)

}

function ShowInputs(type) {
    switch(type) {
        case "res":
            showElements(buildingTypes.residential)
            break;
        case "com":
            showElements(buildingTypes.commercial)
            break;
        case "corp":
            showElements(buildingTypes.corporate)
            break;
        case "hyb":
            showElements(buildingTypes.hybrid)
            break;
    }
}

// show the selectect elements the elements
function showElements(elems)
{
    // hide everything before showing the right ones
    hideElements(buildingTypes.residential)
    hideElements(buildingTypes.commercial)
    hideElements(buildingTypes.corporate)
    hideElements(buildingTypes.hybrid)

    //do a for each for the elements in the array
	elems.forEach(element => {
        $("#"+element).css("display", "block");

    });
}

// function to hide elements
function hideElements(elems)
{
    // do a for each and also set the input values to blank
	elems.forEach(element => {
        $("#"+element).css("display", "none");
        $("#"+element).value = " ";
    });
}

function displayResults() {
    
     
    // Display the recommended number of elevators
    $("#elevatorNum").val(outputValues.elevatorsRequired)

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