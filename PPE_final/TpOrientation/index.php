<?php

	require_once("util/pdoCourse.php");
	session_start();
	include("vues/vEntete.php") ;
	
	
	include("vues/vBandeauConnect.php") ;
	
	if(!isset($_REQUEST['uc']))
		 $uc = 'accueil';
	else
		$uc = $_REQUEST['uc'];
	
	$pdo = PdoCourse::getPDOCourse();
	
	switch($uc)
{
	case 'accueil':{
		include("vues/vAccueil.php");
		break;
	}
	case 'connexion' :{
		if(isset($_SESSION['id']))
			 include ("vues/vConnecte.php");
		else
			include("controleurs/cConnexion.php");
		
		break;
	}
	case 'rechercher' :{
		//include ("vues/vRechercher.php");
		include("controleurs/cRechercher.php");
		break;
	}
	case 'edition' :{
		//include ("vues/vRechercher.php");
		include("vues/vEdition.php");
		break;
	}
	case 'presentation' :{
		//include ("vues/vRechercher.php");
		include("vues/vPresentation.php");
		break;
	}
}
?>
