<div class="row">
	<div class="col-md-6">
		<form method="post" action="index.php?uc=rechercher">
		
			<input id="recherche" name="recherche" type="text" class="form-control" >
			<input type="submit" value="Rechercher" name="rechercher" class="btn btn-success">
		</form>
		<table class="table table-hover table-bordered">
			<thead>
				<tr>
				
					<th>
						Nom de la course
					</th>
					<th>
						Ville
					</th>
					<th>
						Code Postal
					</th>
					<th>
						Date
					</th>
				</tr>
			</thead>
			<tbody>
			<?php
			if(isset($lesCourses)){
				foreach( $lesCourses as $uneCourse){
					$idEdition = $uneCourse['id'];
					$nomCourse = $uneCourse['libelle'];
					$ville = $uneCourse['ville'];
					$codePostal = $uneCourse['cp'];
					$dateEpreuve = $uneCourse['dateEpreuve'];
					
					echo("<tr onclick=\"document.location.href='index.php?uc=edition&id=".$idEdition."'\"><td>".$nomCourse."</td><td>".$ville."</td><td>".$codePostal."</td><td>".$dateEpreuve."</td></tr>");
					
				}
				
			}
			?>
			
			
			
			</tbody>
			
		</table>
		
		
	</div>
	<div class="col-md-6">
		 <span class="badge badge-default">Carte des épreuves :</span><img alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
	</div>
</div>
