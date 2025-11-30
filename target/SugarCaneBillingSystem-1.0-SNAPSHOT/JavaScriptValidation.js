function addition() {

    let a = 10;

    console.log(a);
}

function demo() {
    var id = document.getElementById('heading');
    id.style.color = "red";
}


function show(str) {

    console.log(str);
}

function validationName(str) {

    if (str === null || str === "") {
        var id1 = document.getElementById('validationerror');
        id1.innerHTML = "Required";
        alert("All Fields are Mendatory");

        id1.style.color = "red";

    } else {
        document.getElementById('validationerror').innerHTML = "";
    }
}

function emailValidation(str) {
    var expression = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var validate = expression.test(str)
    if (validate === false) {

        var id1 = document.getElementById('errormessageemail');
        id1.innerHTML = "Invalid Email";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById('errormessageemail');
        id1.innerHTML = "";
    }
}

function mobileValidation(str, id) {

    if (str.length > 10 || str.length < 10) {

        var id1 = document.getElementById(id);
        id1.innerHTML = "Invalid mobile";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById(id);
        id1.innerHTML = "";
    }
}
function passwordValidation(str, id) {

    var expression = /^(?=.\d)(?=.[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20}$/;
    var validate = expression.test(str)
    if (validate === false) {

        var id1 = document.getElementById(id);
        id1.innerHTML = "Invalid Password";
        id1.style.color = "red";
    } else {
        var id1 = document.getElementById(id);
        id1.innerHTML = "";
    }
}









//validation code 
//Only Integer Validation On Key Event:

if (evt.getKeyChar() >= '0' && evt.getKeyChar() <= '9' || evt.getKeyCode() == evt.VK_BACK_SPACE)
{
    jTextField1.setEditable(true);
} else
{
    jTextField1.setEditable(false);
}



//Only String Validation On Key Event:
if (Character.isAlphabetic(evt.getKeyChar()) || evt.getKeyCode() == 46 || evt.getKeyCode() == 32 || evt.getKeyCode() == evt.VK_BACK_SPACE)
{
    jTextField1.setEditable(true);

} else
{
    jTextField1.setEditable(false);

}


//10 Digit Contact Number Validation On Key Event:


if (evt.getKeyChar() >= '0' && evt.getKeyChar() <= '9' && jTextField3.getText().length() < 10 || evt.getKeyCode() == evt.VK_BACK_SPACE)
{

    jTextField3.setEditable(true);

} else
{
    jTextField3.setEditable(false);

}


//Only Float Validation On Key Event:

if (evt.getKeyChar() >= '0' && evt.getKeyChar() <= '9' || evt.getKeyCode() == evt.VK_BACK_SPACE || evt.getKeyCode() == 46)
{

    jTextField1.setEditable(true);

} else
{
    jTextField1.setEditable(false);

}


//String and Integer  Validation On Key Event

if (Character.isAlphabetic(evt.getKeyChar()) || evt.getKeyCode() == evt.VK_BACK_SPACE || evt.getKeyCode() == 32 || evt.getKeyChar() >= '0' && evt.getKeyChar() <= '9')
{
    txtfullname.setEditable(true);

} else
{
    txtfullname.setEditable(false);

}


//Email  Validation On Key Event:

if (Character.isAlphabetic(evt.getKeyChar()) ||
        Character.isDigit(evt.getKeyChar()) ||
        evt.getKeyChar() == '@' ||
        evt.getKeyChar() == '.' ||
        evt.getKeyChar() == '_' ||
        evt.getKeyChar() == '-' ||
        evt.getKeyCode() == evt.VK_BACK_SPACE) {

    txt_email.setEditable(true);
} else {
    Txt_email.setEditable(false);
}
