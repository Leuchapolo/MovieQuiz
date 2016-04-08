if (document.title == "Error")
{
	var error = document.getElementById("error").value
	errorMessage(error)
}

function getChoice(score)
{
	
	if (confirm("Holy cow you won. Continue?"))
	{
		document.getElementById("score").setAttribute("value", score + 1);
	}
	else
	{
		document.getElementById("score").setAttribute("value", 0);
	}
	document.getElementById("continue").submit();
}

function errorMessage(error)
{
	reply = alert(error);
	document.getElementById("form").submit();
	
}