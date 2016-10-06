function showFavorite(id)
{
		//alert(" user="+id);
		var xmlhttp;
		if (id=="" || id==null)
	 	{
			return;
	  	}
		
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
	
		var str="makeFavorite.jsp?id="+id;
		//alert(str);
		xmlhttp.open("GET",str,true);
		xmlhttp.send();
		document.getElementById(id).innerHTML="Favorite";
}
