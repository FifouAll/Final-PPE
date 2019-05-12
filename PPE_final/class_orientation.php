<?php

class PDOCourse
{
	//private static $serveur ='mysql:host=localhost';
	private static $serveur ='mysql:host=172.19.0.29';
	private static $bdd='dbname=orientation_PPE';
	private static $user='root' ; 
	private static $mdp='0550002D';
	private static $monPdo;
	private static $monPDOCourse = null;
	
	
	private function __construct()
	{
		PDOCourse::$monPdo = new PDO(PDOCourse::$serveur.';'.PDOCourse::$bdd, PDOCourse::$user, PDOCourse::$mdp); 
		PDOCourse::$monPdo->query("SET CHARACTER SET utf8");
	}
	
	public function __destruct()
	{
		PDOCourse::$monPDO = null;
	}
	
	public static function getPDOCourse()
	{
		if(PDOCourse::$monPDOCourse == null)
		{
			PDOCourse::$monPDOCourse = new PDOCourse();
		}
		return PDOCourse::$monPDOCourse;
	}
	
	//clubs
	
	public function getLesClub()
	{
		$req = "select * from club";
		$res = PDOCourse::$monPdo->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}
	
	public function getIDClub($id)
	{
		$req = "select * from club WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll;
		return $res;
	}
	
	public function getnomClub($nom_club)
	{
		$req = "select * from club WHERE nom = '$nom_club'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll;
		return $res;
	}
	
	//editions
	
	public function getLesEditions()
	{
		$req = "select * from edition";
		$res = PDOCourse::$monPDO->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}
	
	public function getIDClub($id)
	{
		$req = "select * from edition WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll;
		return $res;
	}
	
	public function getListeEpreuves($lesepreuves)
	{
		$req = "select * from edition WHERE id_epreuve = '$lesepreuves'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll;
		return $res;
	}
	
	//epreuves
	
	public function getLesEpreuves()
	{
		$req = "select * from epreuve";
		$res = PDOCourse::$monPDO->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}
	
	public function getIDEpreuves($id)
	{
		$req = "select * from epreuve WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function getListeClub($lesclubs)
	{
		$req = "select * from epreuve WHERE club = '$lesclubs'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	//equipes
	
	public function getLesEquipe() 
	{
		$req = "select * from equipe";
		$res = PDOCourse::$monPDO->query($req);
		$lesLignes = $res->fetchAll(); 
		return $lesLignes;
	}
	
	public function getIDEquipe($id)
	{
		$req = "select * from equipe WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function getnomEquipe($nom_equipe)
	{
		$req = "select * from equipe WHERE nomEquipe = '$nom_equipe'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	// participants
	
	public function getLesParticipants()
	{
		$req = "select * from participant";
		$res = PDOCourse::$monPDO->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}
	
	public function getIDParticipant($id)
	{
		$req = "select * from participant WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function getListeParticipants($lesparticipants)
	{
		$req = "select * from participant WHERE equipe = '$lesparticipants'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	//participer
	
	public function getParEdi()
	{
		$req = "select * from participer";
		$res = PDOCourse::$monPDO->query($req);
		$lesLignes = $res->fetchAll();
		return $lesLignes;
	}
	
	public function getParticipantInEdition($monedition)
	{
		$req = "select * from participer WHERE id_edition = '$monedition'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	//inscription
	
	public function checkLogin($email, $mdp)
	{
		$req = "SELECT Count(*) as c, id FROM participant WHERE email = '$email' and mdp = '$mdp'";
		$res = PDOCourse::$monPDO->query($req)->fetch();
		if($res["c"] > 0)
		{
			return $res["id"];
		}
		else
		{
			return null;
		}
	}
	
	public function affichageDate($id)
	{
		$req = "SELECT dateEpreuve from edition WHERE id = '$id'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function villeClub($ville)
	{
		$req  = "SELECT ville from club WHERE ville = '$ville'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function libelleEpreuve($libelle)
	{
		$req = "SELECT libelle from epreuve WHERE libelle = '$libelle'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function descriptionEpreuve($description)
	{
		$req = "SELECT description from epreuve WHERE description = '$description'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function latitudeClub($latitude)
	{
		$req = "SELECT latitude from club WHERE latitude = '$latitude'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function longitudeClub($longitude)
	{
		$req = "SELECT longitude from club WHERE longitude = '$longitude'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function nbInscrit($id)
	{
		$req = "SELECT count(id) FROM participant WHERE equipe = '$equipe'";
		$res = PDOCourse::$monPDO->query($req)->fetchAll();
		return $res;
	}
	
	public function recherche($ville)
	$req = "SELECT * , Count(*) as c from club inner join epreuve on club.id = epreuve.club WHERE ville = '$ville'";
	$res = PDOCourse::$monPDO->query($req)->fetch();
	if($res["c"] > 0)
	{
		return $res["id"];
	}
	else
	{
		return null;
	}

	
	//préciser un statut
	
}
	
	
	
	
	
	