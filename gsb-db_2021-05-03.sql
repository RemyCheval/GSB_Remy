-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 03 mai 2021 à 14:10
-- Version du serveur :  8.0.18
-- Version de PHP : 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte_rendu`
--

CREATE TABLE `compte_rendu` (
  `idCompRendu` int(10) NOT NULL,
  `dateRapport` date NOT NULL,
  `bilan` text NOT NULL,
  `idPract` int(10) NOT NULL,
  `idMotif` int(10) NOT NULL,
  `idVisi` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `compte_rendu`
--

INSERT INTO `compte_rendu` (`idCompRendu`, `dateRapport`, `bilan`, `idPract`, `idMotif`, `idVisi`) VALUES
(1, '2020-11-10', 'Pas terrible', 2, 3, 'a17'),
(2, '2020-11-10', 'Pas ouf', 2, 3, 'a17'),
(3, '2020-10-19', 'Pas terrible', 2, 3, 'a17'),
(4, '2021-04-29', 'test insert', 1, 1, 'a17');

-- --------------------------------------------------------

--
-- Structure de la table `echantillon`
--

CREATE TABLE `echantillon` (
  `idCR` int(10) NOT NULL,
  `codeM` int(10) NOT NULL,
  `nbEchantillons` int(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a131', '202010', 0, NULL, '2020-10-02', 'CR'),
('a17', '202009', 0, NULL, '2020-11-13', 'VA'),
('a17', '202010', 120, '140.00', '2020-11-20', 'RB'),
('a17', '202011', 0, NULL, '2020-12-04', 'CL'),
('a17', '202012', 0, NULL, '2021-03-26', 'CL'),
('a17', '202103', 0, NULL, '2021-04-02', 'CL'),
('a17', '202104', 0, NULL, '2021-04-02', 'CR'),
('c54', '202009', 0, NULL, '2020-11-13', 'CR'),
('c54', '202010', 0, NULL, '2020-11-13', 'CR'),
('c54', '202011', 0, NULL, '2020-11-13', 'CL'),
('c54', '2021', 0, NULL, '2020-11-13', 'CR');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a131', '202010', 'ETP', 1),
('a131', '202010', 'KM', 0),
('a131', '202010', 'NUI', 0),
('a131', '202010', 'REP', 0),
('a17', '202009', 'ETP', 12),
('a17', '202009', 'KM', 8),
('a17', '202009', 'NUI', 12),
('a17', '202009', 'REP', 8),
('a17', '202010', 'ETP', 121),
('a17', '202010', 'KM', 21),
('a17', '202010', 'NUI', 12),
('a17', '202010', 'REP', 21),
('a17', '202011', 'ETP', 5),
('a17', '202011', 'KM', 12),
('a17', '202011', 'NUI', 12),
('a17', '202011', 'REP', 5),
('a17', '202012', 'ETP', 0),
('a17', '202012', 'KM', 0),
('a17', '202012', 'NUI', 0),
('a17', '202012', 'REP', 0),
('a17', '202103', 'ETP', 0),
('a17', '202103', 'KM', 0),
('a17', '202103', 'NUI', 0),
('a17', '202103', 'REP', 0),
('a17', '202104', 'ETP', 0),
('a17', '202104', 'KM', 0),
('a17', '202104', 'NUI', 0),
('a17', '202104', 'REP', 0),
('c54', '202009', 'ETP', 6),
('c54', '202009', 'KM', 45),
('c54', '202009', 'NUI', 7),
('c54', '202009', 'REP', 7),
('c54', '202010', 'ETP', 5),
('c54', '202010', 'KM', 80),
('c54', '202010', 'NUI', 2),
('c54', '202010', 'REP', 15),
('c54', '202011', 'ETP', 0),
('c54', '202011', 'KM', 0),
('c54', '202011', 'NUI', 0),
('c54', '202011', 'REP', 0),
('c54', '2021', 'ETP', 0),
('c54', '2021', 'KM', 0),
('c54', '2021', 'NUI', 0),
('c54', '2021', 'REP', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  `isRefuse` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`, `isRefuse`) VALUES
(1, 'c54', '202010', 'REFUSE : ok', '2020-05-30', '123.00', 1),
(2, 'c54', '202011', 'oui', '2020-10-02', '1234.00', 0);

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `codeM` int(10) NOT NULL,
  `nomCommercial` varchar(255) NOT NULL,
  `famille` varchar(255) NOT NULL,
  `compo` text NOT NULL,
  `effetIndesi` text NOT NULL,
  `contreIndic` text NOT NULL,
  `prix` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`codeM`, `nomCommercial`, `famille`, `compo`, `effetIndesi`, `contreIndic`, `prix`) VALUES
(1234, 'TRIMYCINE', 'Corticoïde antibiotique et antifongique à usage local ', 'Trimconolone + Néomycine+ Nystatine', 'Ce médicament est un corticoide à activité forte    ', 'Ce médicament est contre-indiqué en cas d\'allergie', 50),
(4578, 'LIDOXYTRACINE', 'Antibiotique', 'Tétracycline + Lidocaïne\r\n', 'Ce médicament est utilisé en injection', 'Ce médicament est contre indiqué en cas d\'allergie ', 20);

-- --------------------------------------------------------

--
-- Structure de la table `motif`
--

CREATE TABLE `motif` (
  `idMotif` int(10) NOT NULL,
  `libMotif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `motif`
--

INSERT INTO `motif` (`idMotif`, `libMotif`) VALUES
(1, 'Périodicités'),
(2, 'Les nouveautés / actualisations'),
(3, 'Remontages'),
(4, 'Sollicitation de la part des Médecins');

-- --------------------------------------------------------

--
-- Structure de la table `poste`
--

CREATE TABLE `poste` (
  `numP` int(2) NOT NULL,
  `libelle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poste`
--

INSERT INTO `poste` (`numP`, `libelle`) VALUES
(0, 'Visiteur médical'),
(1, 'Comptable');

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `idPract` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `cp` int(6) NOT NULL,
  `coeffNota` int(2) NOT NULL,
  `lieuExercise` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`idPract`, `nom`, `prenom`, `adresse`, `ville`, `cp`, `coeffNota`, `lieuExercise`) VALUES
(1, 'Forax', 'Thomas', '6bis Rue du Petit Pont', 'Douai', 59500, 13, 'Douai'),
(2, 'OffSpring', 'Jack', '12 Rue de la Girouette', 'Mâcon', 71000, 12, 'Mâcon');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `numPoste` int(2) NOT NULL DEFAULT '0',
  `secteur` varchar(255) NOT NULL,
  `labo` varchar(255) NOT NULL,
  `idVi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `numPoste`, `secteur`, `labo`, `idVi`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1, 'Est', 'Bichat', 1),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 0, 'Sud', 'Swiss Kane', 2),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 0, 'Ouest', 'Gyverny', 3),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 0, 'Est', 'Swiss Kane', 4),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 0, 'Sud', 'Bichat', 5),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 0, 'Nord', 'Gyverny', 6),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 0, 'Sud', 'Swiss Kane', 7),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 0, 'Ouest', 'Gyverny', 8),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 0, 'Sud', 'Bichat', 9),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 0, 'Est', 'Gyverny', 10),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 0, 'Nord', 'Bichat', 11),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 0, 'Ouest', 'Swiss Kane', 12),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 0, 'Sud', 'Bichat', 13),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 0, 'Nord', 'Bichat', 14),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 0, 'Est', 'Swiss Kane', 15),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 0, 'Ouest', 'Gyverny', 16),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 0, 'Nord', 'Swiss Kane', 17),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 0, 'Sud', 'Gyverny', 18),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 0, 'Sud', 'Bichat', 19),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 0, 'Nord', 'Bichat', 20),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 0, 'Ouest', 'Swiss Kane', 21),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 0, 'Est', 'Gyverny', 22),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 0, 'Ouest', 'Swiss Kane', 23),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 0, 'Nord', 'Bichat', 24),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 0, 'Ouest', 'Bichat', 25),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01', 0, 'Est', 'Gyverny', 26),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 0, 'Nord', 'Swiss Kane', 27);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `compte_rendu`
--
ALTER TABLE `compte_rendu`
  ADD PRIMARY KEY (`idCompRendu`),
  ADD KEY `idPract` (`idPract`),
  ADD KEY `idMotif` (`idMotif`),
  ADD KEY `idVisi` (`idVisi`) USING BTREE;

--
-- Index pour la table `echantillon`
--
ALTER TABLE `echantillon`
  ADD PRIMARY KEY (`idCR`,`codeM`),
  ADD KEY `codeM` (`codeM`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`,`mois`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`codeM`);

--
-- Index pour la table `motif`
--
ALTER TABLE `motif`
  ADD PRIMARY KEY (`idMotif`);

--
-- Index pour la table `poste`
--
ALTER TABLE `poste`
  ADD PRIMARY KEY (`numP`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`idPract`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numPoste` (`numPoste`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `compte_rendu`
--
ALTER TABLE `compte_rendu`
  MODIFY `idCompRendu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `codeM` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4579;

--
-- AUTO_INCREMENT pour la table `motif`
--
ALTER TABLE `motif`
  MODIFY `idMotif` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `idPract` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `compte_rendu`
--
ALTER TABLE `compte_rendu`
  ADD CONSTRAINT `compte_rendu_ibfk_1` FOREIGN KEY (`idVisi`) REFERENCES `visiteur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_ibfk_2` FOREIGN KEY (`idPract`) REFERENCES `praticien` (`idPract`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_rendu_ibfk_3` FOREIGN KEY (`idMotif`) REFERENCES `motif` (`idMotif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `echantillon`
--
ALTER TABLE `echantillon`
  ADD CONSTRAINT `echantillon_ibfk_2` FOREIGN KEY (`idCR`) REFERENCES `compte_rendu` (`idCompRendu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `echantillon_ibfk_3` FOREIGN KEY (`codeM`) REFERENCES `medicament` (`codeM`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

--
-- Contraintes pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD CONSTRAINT `visiteur_ibfk_1` FOREIGN KEY (`numPoste`) REFERENCES `poste` (`numP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
