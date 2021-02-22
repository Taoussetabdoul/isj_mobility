-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 22 fév. 2021 à 13:53
-- Version du serveur :  10.3.16-MariaDB
-- Version de PHP :  7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `isj_mobile`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(10) UNSIGNED NOT NULL,
  `contenu` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_publication` datetime NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trajet_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

CREATE TABLE `disponibilite` (
  `id` int(10) UNSIGNED NOT NULL,
  `jour_semaine` enum('lundi','mardi','mercredi','jeudi','vendredi','samedi','dimanche') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `disponibilite`
--

INSERT INTO `disponibilite` (`id`, `jour_semaine`, `created_at`, `updated_at`) VALUES
(1, 'lundi', NULL, NULL),
(2, 'mardi', NULL, NULL),
(3, 'mercredi', NULL, NULL),
(4, 'jeudi', NULL, NULL),
(5, 'vendredi', NULL, NULL),
(6, 'samedi', NULL, NULL),
(7, 'dimanche', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `id` int(10) UNSIGNED NOT NULL,
  `intitule` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `intitule`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(101, 'Anguissa', NULL, NULL, NULL, NULL),
(102, 'Etoudi', NULL, NULL, NULL, NULL),
(103, 'Carrefour Meec', NULL, NULL, NULL, NULL),
(104, 'Eyang', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `souscription`
--

CREATE TABLE `souscription` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `trajet_id` int(10) UNSIGNED NOT NULL,
  `date_souscription` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `souscription`
--

INSERT INTO `souscription` (`id`, `user_id`, `trajet_id`, `date_souscription`, `created_at`, `updated_at`, `is_valid`) VALUES
(3, 2, 16, '2021-02-06', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `trajet`
--

CREATE TABLE `trajet` (
  `id` int(10) UNSIGNED NOT NULL,
  `nbre_place` int(11) NOT NULL,
  `prix` double NOT NULL,
  `type` enum('Aller','Aller-Retour','Retour') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Aller-Retour',
  `lieu_id_depart` int(10) UNSIGNED NOT NULL,
  `lieu_id_arrive` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `heure_depart` time NOT NULL,
  `heure_retour` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet`
--

INSERT INTO `trajet` (`id`, `nbre_place`, `prix`, `type`, `lieu_id_depart`, `lieu_id_arrive`, `user_id`, `created_at`, `updated_at`, `heure_depart`, `heure_retour`) VALUES
(16, 3, 2000, 'Aller-Retour', 102, 103, 1, '2021-01-31 22:33:08', '2021-02-09 02:19:41', '06:50:00', '16:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `trajet_disponibilite`
--

CREATE TABLE `trajet_disponibilite` (
  `id` int(10) UNSIGNED NOT NULL,
  `trajet_id` int(10) UNSIGNED NOT NULL,
  `disponibilite_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trajet_disponibilite`
--

INSERT INTO `trajet_disponibilite` (`id`, `trajet_id`, `disponibilite_id`, `created_at`, `updated_at`) VALUES
(22, 16, 1, NULL, NULL),
(23, 16, 2, NULL, NULL),
(24, 16, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `email`, `password`) VALUES
(1, 'fssds', 'tar@isj.cm', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(2, 'dfdfd', 'tar@@isj.cm', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3'),
(3, 'TAOUSSET', 'tar@me.cm', 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(4, 'kem', 'k@isj.cm', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
