<?php
/** 
 * Script de contrôle et d'affichage du cas d'utilisation "Consulter une fiche de frais"
 * @package default
 * @todo  RAS
 */
  $repInclude = './include/';
  require($repInclude . "_init.inc.php");
  require($repInclude . "_entete.inc.html");
  require($repInclude . "_sommaire.inc.php");  
  
  
   // page inaccessible si visiteur non connecté
  if (! estVisiteurConnecte() || $_SESSION["numPoste"] != 0) {
    header("Location: cSeConnecter.php");  
  }
$requete = "SELECT id, nom, prenom,adresse,ville,cp,coefNotoriete,lieuExercice 
            FROM practicien 
            ORDER BY 2,3";

$listeUser = mysqli_query($idConnexion, $requete);
$donnees = mysqli_fetch_row($listeUser);
$result = $idConnexion->query($requete);
if(!isset($_POST["button-details"])){
?>

<form action="cAppli.php" method="POST">
  <table>
	<tr>
		<td>Numéro Rapport : </td>
	</tr>
	<tr>
		<td>Practicien : </td>
		<td><select id="idVisi" name="idVisi" title="Sélectionnez le visiteur souhaité">
	<?php 
	if($result->num_rows > 0) {
	    while($donnees = $result->fetch_assoc()) {
	        $userN = $donnees["nom"];
	        $userP = $donnees["prenom"];
	        $userID = $donnees["id"];
	        
	?>    
    <option name="namecr" value="<?php echo $userID; ?>"> <?php echo $userN ." ". $userP; ?> </option>
<?php
    }
} else {
    echo 'NO RESULTS';  
}
?>
            </td></select>
		<td><input type="submit" name="button-details"  value="Détails"/></td>
	</tr>
	<tr>
		<td>Date Rapport :  </td>
		<td><input type="text" name="crdate"/></td>
	</tr>
	<tr>
		<td>Motif Visite : </td>
		<td><input type="text" name="crmotif"/></td>
	</tr>
	<tr>
		<td>BILAN</td>
		<td><textarea class="crbilan" cols="17" rows="5"></textarea></td>
		
		<td>Offre d'échantillons : </td>
		<td><textarea name="croffre" cols="17" rows="5"></textarea></td>

	</tr>
	<tr>
		<td><a  href="#"><BUTTON class="crbouton">Précédent</BUTTON>  </a></td>
		<td><a href="#"><BUTTON class="crbouton">Suivant</BUTTON>  </a></td>
		<td><a href="#"><BUTTON class="crbouton">Nouveau</BUTTON>  </a></td>
	</tr>

  </table>
</form>
<?php
}else {?>
	<form>
		<div name="details">
			<?php
			$nom=$_POST["namecr"]
			$req = "SELECT id, nom, prenom,adresse,ville,cp,coefNotoriete,lieuExercice 
            FROM practicien WHERE id=".$userID"
            ORDER BY 2,3";

			$listePra = mysqli_query($idConnexion, $req);
			$donnee = mysqli_fetch_row($listePra);
			$resultat = $idConnexion->query($req);

			if($resultat->num_rows > 0) {
				while($donnee = $resultat->fetch_assoc()) {
			        $userN = $donnees["nom"];
			        $userP = $donnees["prenom"];
			        $userID = $donnees["id"];
			        $userAd=  $donnees["adresse"];
			        $userVille=  $donnees["ville"];
			        $userCp=  $donnees["cp"];
			        $userCoef=  $donnees["coefNotoriete"];
			        $userLieu=  $donnees["lieuExercice"];
	?>  

			<p>Nom : <?php echo $nom ?></p>
			<p>Prenom : <?php echo $userP ?></p>


<?php }}?>

		</div>	



		<input type = "button" value = "Retour"  onclick = "history.go(-1)">
	</form> 
<?php
}

?>




<?php   

  require($repInclude . "_pied.inc.html");
  require($repInclude . "_fin.inc.php");
?> 
