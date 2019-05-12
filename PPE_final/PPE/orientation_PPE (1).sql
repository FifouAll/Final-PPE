-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 27 Mars 2019 à 16:25
-- Version du serveur :  10.1.26-MariaDB-0+deb9u1
-- Version de PHP :  7.0.27-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `orientation_PPE`
--

-- --------------------------------------------------------

--
-- Structure de la table `club`
--

CREATE TABLE `club` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `contact` varchar(128) NOT NULL,
  `adresse` varchar(128) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `ville` varchar(128) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `club`
--

INSERT INTO `club` (`id`, `nom`, `contact`, `adresse`, `cp`, `ville`, `latitude`, `longitude`) VALUES
(1, 'Association Touquet Raid', 'contact@touquetraid.com', 'Palais des sports', '62520', 'Le Touquet', 50.51874220000001, 1.60118250000005);

-- --------------------------------------------------------

--
-- Structure de la table `edition`
--

CREATE TABLE `edition` (
  `id` int(11) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `id_epreuve` int(11) DEFAULT NULL,
  `annee` int(11) DEFAULT NULL,
  `dateEpreuve` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `edition`
--

INSERT INTO `edition` (`id`, `description`, `id_epreuve`, `annee`, `dateEpreuve`) VALUES
(1, 'Pour cette ?dition, l??v?nement prendra place en plein c?ur du Touquet en front de mer! Amis comp?titeurs vous serez sous le feu des projecteurs !', 1, 2019, '2019-03-24');

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

CREATE TABLE `epreuve` (
  `id` int(11) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `club` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `libelle`, `description`, `club`) VALUES
(1, 'Touquet Raid Pas de Calais', 'Un parcours Orientation sera mis en place sur la place du Centenaire. Des parcours ?tudi?s pour vous faire d?couvrir encore et toujours de nouveaux espaces naturels, de nouveaux chemins et pour vous faire profiter du superbe territoire qu?offre notre littoral avec ses plages. Mais? nous n?en dirons pas plus, le trac? restera secret et ne sera d?voil? quelques minutes avant le d?but de l??preuve.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `equipe`
--

CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `nomEquipe` varchar(50) DEFAULT NULL,
  `couleur` varchar(50) DEFAULT NULL,
  `mdp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `equipe`
--

INSERT INTO `equipe` (`id`, `nomEquipe`, `couleur`, `mdp`) VALUES
(1, 'Equipe 1', 'blue', '1234'),
(2, 'Equipe 2', 'green', '5678'),
(3, 'Equipe 3', 'red', '0000');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `equipe` int(11) DEFAULT NULL,
  `mdp` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participant`
--

INSERT INTO `participant` (`id`, `nom`, `prenom`, `email`, `equipe`, `mdp`) VALUES
(1, 'Toto', 'Lucas', 'lucas.toto@gmail.com', 1, '1234'),
(2, 'Robert', 'Jean', 'jean.robert@yahoo.fr', 1, '1234'),
(3, 'Robert', 'Charles', 'charles.robert@yahoo.fr', 2, '1234'),
(4, 'Doe', 'John', 'john.doe@outlook.fr', 2, '1234'),
(5, 'Dupont', 'Jean', 'jean.dupont@gmail.com', 3, '1234');

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

CREATE TABLE `participer` (
  `id_participant` int(11) NOT NULL,
  `id_edition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participer`
--

INSERT INTO `participer` (`id_participant`, `id_edition`) VALUES
(4, 1),
(5, 1);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `edition`
--
ALTER TABLE `edition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_epreuve` (`id_epreuve`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_club` (`club`);

--
-- Index pour la table `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_participant_equipe` (`equipe`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id_participant`,`id_edition`),
  ADD KEY `fk_id_edition` (`id_edition`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `edition`
--
ALTER TABLE `edition`
  ADD CONSTRAINT `fk_epreuve` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `FK_club` FOREIGN KEY (`club`) REFERENCES `club` (`id`);

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_participant_equipe` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id`),
  ADD CONSTRAINT `fk_equipe` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `fk_id_edition` FOREIGN KEY (`id_edition`) REFERENCES `edition` (`id`),
  ADD CONSTRAINT `fk_id_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
