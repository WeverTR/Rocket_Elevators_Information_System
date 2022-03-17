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


function start() {
    $("#building-type").change(ChooseType)
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

function showElements(elems)
{
    hideElements(buildingTypes.residential)
    hideElements(buildingTypes.commercial)
    hideElements(buildingTypes.corporate)
    hideElements(buildingTypes.hybrid)

	elems.forEach(element => {
        $("#"+element).css("display", "block");

    });
}

function hideElements(elems)
{
	elems.forEach(element => {
        $("#"+element).css("display", "none");
    });
}