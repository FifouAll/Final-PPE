<?php


$action = $_REQUEST['action'];

switch($action)
{
	case 'seConnecter':
	{
		
		$verifConnexion = $pdo->checkLogin($_REQUEST['email'], $_REQUEST['mdp']);
		if($verifConnexion != null){
			
			$_SESSION['id'] = $verifConnexion;
			
			include ("vues/vConnecte.php");
		}
		else{
			$message = "Adresse email ou mot de passe incorrect.";
			include ("vues/vMessage.php");
			
		}
		
		break;
	}
	
}

?>
<script>
document.getElementById("boutonRechercher").style.visibility = "visible"; 
</script>
