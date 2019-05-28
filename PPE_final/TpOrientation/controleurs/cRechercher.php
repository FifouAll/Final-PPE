<?php
	if(isset($_REQUEST['recherche'])){
		$recherche = $_REQUEST['recherche'];
		if(is_numeric($recherche)){
			$lesCourses = $pdo->rechercheCp($recherche);
		#	$lesParticipants = $pdo->lsParticipant($recherche);
		}
		else{ 
			$lesCourses = $pdo->rechercheVille($recherche);
		#	$lesParticipants = $pdo->lsParticipant($recherche);
		}
		//var_dump($lesCourses);
	}
	include("vues/vRechercher.php");

?>

<?php
	if(isset($_REQUEST['id'])){
		$id = $_REQUEST['id'];
		$uneEdition = $pdo->getEditionId($id);
	}
	//var_dump($uneEdition);
	if(isset($uneEdition)){
		foreach( $uneEdition as $edition){
			$dateEdition = $edition['dateEpreuve'];
			$villeEdition = $edition['ville'];
			$libelle = $edition['libelle'];
			$annee = $edition['annee'];
			$description = $edition['description'];
			$descriptionEdition = $edition['descriptionEdition'];
			
			$cp = $edition['cp'];
			$adresse = $edition['adresse'];
			$contact = $edition['contact'];
			$latitude = $edition['latitude'];
			$longitude = $edition['longitude'];
		}
		$nbParticipant = $pdo->nbParticipantEdition($id);
	}
	
?>