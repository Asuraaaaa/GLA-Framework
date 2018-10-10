var documentWidth = document.documentElement.clientWidth;
var documentHeight = document.documentElement.clientHeight;

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "enableui") {
            document.body.style.display = event.data.enable ? "block" : "none";
            $(".Form-Container").css("display", "block");
            $(".Form-Password").css("display", "block");
            $(".Form-CCreate").css("display", "none");
            $(".Form-CChoose").css("display", "none");
            $("#login").css("display", "block");
        }

        if (event.data.type == "enablecreateui") {
            document.body.style.display = event.data.enable ? "block" : "none";
            $(".Form-Container").css("display", "block");
            $(".Form-CChoose").css("display", "none");
            $(".Form-Password").css("display", "none");
            $(".Form-CCreate").css("display", "block");
            $("#login").css("display", "block");
        }

        if (event.data.type == "enableccui") {
            document.body.style.display = event.data.enable ? "block" : "none";
            $(".Form-Container").css("display", "block");
            $(".Form-CChoose").css("display", "block");
            $(".Form-Password").css("display", "none");
            $(".Form-CCreate").css("display", "none");
            $("#login").css("display", "block");
            document.getElementById("char1name").innerHTML = "Name: " + event.data.name1;
            document.getElementById("char1dob").innerHTML = "DOB: " + event.data.dob1;
            document.getElementById("char1gen").innerHTML = "Gender: " + event.data.gen1;
            document.getElementById("char1height").innerHTML = "Height: " + event.data.height1;
            document.getElementById("char2name").innerHTML = "Name: " + event.data.name2;
            document.getElementById("char2dob").innerHTML = "DOB: " + event.data.dob2;
            document.getElementById("char2gen").innerHTML = "Gender: " + event.data.gen2;
            document.getElementById("char2height").innerHTML = "Height: " + event.data.height2;
            document.getElementById("char3name").innerHTML = "Name: " + event.data.name3;
            document.getElementById("char3dob").innerHTML = "DOB: " + event.data.dob3;
            document.getElementById("char3gen").innerHTML = "Gender: " + event.data.gen3;
            document.getElementById("char3height").innerHTML = "Height: " + event.data.height3;
            if (event.data.dob2 == "") {
                document.getElementById("submit2").innerHTML = "Create Character";
                $("#editc2").css("display", "none");
                $("#wipec2").css("display", "none");
            } else {
                document.getElementById("submit2").innerHTML = "Select Character";
                $("#editc2").css("display", "block");
                $("#wipec2").css("display", "block");
            }
            if (event.data.dob3 == "") {
                document.getElementById("submit3").innerHTML = "Create Character";
                $("#editc3").css("display", "none");
                $("#wipec3").css("display", "none");
            } else {
                document.getElementById("submit3").innerHTML = "Select Character";
                $("#editc3").css("display", "block");
                $("#wipec3").css("display", "block");
            }
        }

        if (event.data.type == "disableui") {
            document.body.style.display = "none";
            $(".Form-Container").css("display", "none");
            $(".Form-CChoose").css("display", "none");
            $(".Form-Password").css("display", "none");
            $("#login").css("display", "none");
        }

        if (event.data.type == "IncorrectPW") {
            
        }
    });

    $("#login-form").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting
        
        $.post('http://charactercreation/login', JSON.stringify({
            password: $("#password").val()
        }));
    });
    $("#Char1").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting
        
        $.post('http://charactercreation/char', JSON.stringify({
            id: 1
        }));
    });
    $("#Char2").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting
        
        $.post('http://charactercreation/char', JSON.stringify({
            id: 2
        }));
    });
    $("#Char3").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting
        
        $.post('http://charactercreation/char', JSON.stringify({
            id: 3
        }));
    });
    $("#CC-form").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting
        
        $.post('http://charactercreation/create', JSON.stringify({
            fname: $("#first_name").val(),
            lname: $("#last_name").val(),
            dob: $("#dob").val(),
            gen: $('.option p.selected').attr('id'),
            height: $("#height").val()
        }));
    });
	
	$('.option p').on("click", function() {
		var clicked = this
		$('.option p').each(function() {
			if( clicked != this ) $(this).removeClass("selected")
		})
		$(this).addClass("selected")
	});
	
    $("#editc1").click(function() {$.post('http://charactercreation/editcharacter', JSON.stringify({id: 1})); $(this).blur()})
    $("#editc2").click(function() {$.post('http://charactercreation/editcharacter', JSON.stringify({id: 2})); $(this).blur()})
    $("#editc3").click(function() {$.post('http://charactercreation/editcharacter', JSON.stringify({id: 3})); $(this).blur()})

    $("#wipec1").click(function(){
        if (confirm('Are you sure you want to wipe this character?') === true) {
            $.post('http://charactercreation/wipecharacter', JSON.stringify({
                id: 1
            }));
        } else {

        }
        $(this).blur()
    });
    $("#wipec2").click(function(){
        if (confirm('Are you sure you want to wipe this character?') === true) {
            $.post('http://charactercreation/wipecharacter', JSON.stringify({
                id: 2
            }));
        } else {

        }
        $(this).blur()
    });
    $("#wipec3").click(function(){
        if (confirm('Do you really want to delete this character?') === true) {
            $.post('http://charactercreation/wipecharacter', JSON.stringify({
                id: 3
            }));
        } else {
            
        }
        $(this).blur()
    });
});