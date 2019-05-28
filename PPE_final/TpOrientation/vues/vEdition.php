<?php
	$id = $_REQUEST['id'];
	$uneEdition = $pdo->getEditionId($id);
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
	}
	$nbParticipant = $pdo->nbParticipantEdition($id);
	$lesParticipants = $pdo->lsParticipant($id);
?>
<div class="row">
		<div class="col-md-6">
			<h2>
				<div>
					<?php echo($dateEdition); ?>
				</div><?php echo($villeEdition); ?>
			</h2>
			
			<p>
				<?php echo($libelle." ".$annee); ?>
			</p>
			<p>
				<?php echo($description); ?>
			</p>
			<p>
				<?php echo($descriptionEdition); ?>
			</p>
			<address>
				<strong>Coordonnées et contact</strong><br><?php echo($contact); ?><br><?php echo($adresse." ".$cp." ".$villeEdition); ?>
			</address>
			<div>
				<h2 class="section-hero-header-subtitle">
					<span>GPS : <?php echo($latitude.", ".$longitude)?></span>
				</h2>
			</div>
		</div>
		<div class="col-md-6">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3889.7263110885387!2d1.5963338286529422!3d50.51954351030775!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xbe082af5e6fba2ad!2sTouquet+Tennis+Club!5e0!3m2!1sfr!2sfr!4v1553763147748" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			<h3>
				<div>
					<?php echo($nbParticipant[0]." Inscrits en ".$annee); ?> - 27 l'ont évalué
				</div>Evaluée à 4.3 sur 5
			</h3>
		</div>
	</div>
		<div class="row">
		<div class="col-md-6">
			<h2>
				<div>
					Liste des Participants:
				</div>
			</h2>
		</div>
	</div>
	<table class="table table-hover table-bordered">
		<thead>
			<tr>
				<th>
					Nom
				</th>
				<th>
					Prenom
				</th>
				<th>
					Email
				</th>
			</tr>
		</thead>
		<tbody>
		<?php 
			foreach( $lesParticipants as $unParticipant){
				//echo($unParticipant['nom']); 
				//var_dump($unParticipant);
				$nom = $unParticipant['nom'];
				$prenom = $unParticipant['prenom'];
				$email = $unParticipant['email'];
				
				echo("<tr><td>".$nom."</td><td>".$prenom."</td><td>".$email."</td></tr>");
			
			}
		?>
		</tbody>
			
	</table>