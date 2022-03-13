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
    "elevatorsRequired": 0,
    "columnsRequired": 0,
    "unitPrice": 0,
    "installationCosts:": 0,
    "finalPrice": 0
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

function update(that) {
    
    elevatorsNeeded()
    elevatorUnitPrice()
    displayResults()
}

function elevatorsNeeded() {
   
    
    
    if (buildingType === "residential") {
        
        
        let numOfApts = $("#numofapt").val()

        let numOfFloors = $("#numoffloors").val()
        
        if (numOfApts <= 0 || numOfFloors <= 0) {
            return; 
        }
       
        let avgDoorsPerFloor = Math.ceil(numOfApts / numOfFloors) 
        
        let elevatorShaftsRequired = Math.ceil(avgDoorsPerFloor / 6)
        
        let columnsRequired = Math.ceil(numOfFloors / 20) 

        outputValues.elevatorsRequired = elevatorShaftsRequired * columnsRequired
        

    } else if (buildingType === "commercial") {
        
            let elevatorNum = $("#numofelev").val()
        
        if (elevatorNum <= 0) {
            return; 
        }

        
        
        outputValues.elevatorsRequired = elevatorNum
    

    } else if (buildingType === "corporate" || buildingType === "hybrid") {
       
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
       
        outputValues.elevatorsRequired = elevatorsPerColumn * columnsRequired
       
    }
}

function elevatorUnitPrice() {
  
    $("input[name=liftCage]").each(function () {
       if ($(this).is(':checked')) {
           cage = $(this).val()
        
       }
    })
}

function displayResults() {
    
     
    // Display the recommended number of elevators
    $('#elevatorNum').val(outputValues.elevatorsRequired)

    // Display the unit price of an elevator
    $('#unitPrice').val(`$${liftCage[cage].toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the total price of the elevators
    $('#totalPriceElevators').val(`$${(outputValues.elevatorsRequired * liftCage[cage]).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the installation fees
    let totalPrice = outputValues.elevatorsRequired * liftCage[cage]
    $('#installFees').val(`$${(totalPrice * installFees[cage]).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)

    // Display the final total price including fees
    let installFee = totalPrice * installFees[cage]
    $("#totalPrice").val(`$${(totalPrice + installFee).toLocaleString(undefined, { minimumFractionDigits: 2 })}`)
}