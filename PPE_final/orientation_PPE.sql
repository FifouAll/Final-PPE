-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 29 Mai 2019 à 13:51
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
(1, 'Association Touquet Raid', 'contact@touquetraid.com', 'Palais des sports', '62520', 'Le Touquet', 50.51874220000001, 1.60118250000005),
(2, 'Course d Aras', 'course.aras@gmail.com', 'Rue Descartes', '62000', 'Aras', 50.291031, 2.77896),
(3, 'Bar le duc Running', 'barleduc.running@outlook.com', 'Rue des Romains', '55000', 'Bar-le-Duc', 48.777353, 5.162726),
(4, 'Course de l Ornain', 'course.ornain@gmail.com', 'Avenue de Paris', '55800', 'Revigny-sur-Ornain', 48.829983, 4.980978);

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
(1, 'Pour cette édition, l’évènement prendra place en plein cœur du Touquet en front de mer! Amis compétiteurs vous serez sous le feu des projecteurs !', 1, 2019, '2019-03-24'),
(2, 'Première édition d\'Aras', 2, 2019, '2019-04-02'),
(3, '5ème édition de la course de Bar-le-Duc', 3, 2019, '2019-03-02'),
(4, 'Première édition de Revigny-sur-Ornain', 4, 2018, '2018-04-02'),
(5, 'Deuxième édition d\'Aras', 2, 2018, '2018-04-02'),
(6, 'Deuxième édition du Touquet', 1, 2018, '2018-03-25');

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
(1, 'Touquet Raid Pas de Calais', 'Un parcours Orientation sera mis en place sur la place du Centenaire. Des parcours étudiés pour vous faire découvrir encore et toujours de nouveaux espaces naturels, de nouveaux chemins et pour vous faire profiter du superbe territoire qu’offre notre littoral avec ses plages. Mais… nous n’en dirons pas plus, le tracé restera secret et ne sera dévoilé quelques minutes avant le début de l’épreuve.', 1),
(2, 'Raid d\'Aras', 'Course d\'orientation partant d\'Aras', 2),
(3, 'Course de Meuse', 'Un parcours d\'orientation autour de bar-le-Duc', 3),
(4, 'Tour d\'Ornain', 'Course d\'orientation aux alentours de Revigny-sur-Ornain', 4);

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
  `mdp` varchar(256) DEFAULT NULL,
  `genre` varchar(1) DEFAULT NULL,
  `idClub` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `participant`
--

INSERT INTO `participant` (`id`, `nom`, `prenom`, `email`, `equipe`, `mdp`, `genre`, `idClub`) VALUES
(1, 'Toto', 'Lucas', 'lucas.toto@gmail.com', 1, '1234', 'M', 1),
(2, 'Robert', 'Jean', 'jean.robert@yahoo.fr', 1, '1234', 'M', 1),
(3, 'Robert', 'Charles', 'charles.robert@yahoo.fr', 2, '1234', 'F', 1),
(4, 'Doe', 'John', 'john.doe@outlook.fr', 2, '1234', 'M', 3),
(5, 'Dupont', 'Jean', 'jean.dupont@gmail.com', 3, '1234', 'F', 3),
(6, 'zaer', 'Julie', 'aze.ezf@zzeg.com', 2, '456', 'F', 4);

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
(2, 1),
(3, 3),
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
  ADD KEY `FKEpreuve` (`id_epreuve`);

--
-- Index pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKClubParticiper` (`club`);

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
  ADD KEY `FK_participant_equipe` (`equipe`),
  ADD KEY `FK_participant_club` (`idClub`);

--
-- Index pour la table `participer`
--
ALTER TABLE `participer`
  ADD PRIMARY KEY (`id_participant`,`id_edition`),
  ADD KEY `FKEditionParticiper` (`id_edition`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `edition`
--
ALTER TABLE `edition`
  ADD CONSTRAINT `FKEpreuve` FOREIGN KEY (`id_epreuve`) REFERENCES `epreuve` (`id`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `FKClubParticiper` FOREIGN KEY (`club`) REFERENCES `club` (`id`);

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FKParticipantEquipe` FOREIGN KEY (`equipe`) REFERENCES `equipe` (`id`),
  ADD CONSTRAINT `FK_participant_club` FOREIGN KEY (`idClub`) REFERENCES `club` (`id`);

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `FKEditionParticiper` FOREIGN KEY (`id_edition`) REFERENCES `edition` (`id`),
  ADD CONSTRAINT `FKParticipant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
