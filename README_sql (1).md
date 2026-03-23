# Healthcare Data Analysis — SQL

Analyse de données hospitalières via un pipeline SQL complet : modélisation en étoile, requêtes analytiques et calcul de KPIs de performance médicale.

---

## Contexte

Ce projet simule l'analyse de données d'un système d'information hospitalier (SIH). L'objectif est d'extraire des indicateurs clés de performance (KPIs) sur les hospitalisations, les traitements et la satisfaction patient, à partir d'un modèle de données relationnel.

---

## Modèle de données — Schéma en étoile

```
         dim_date
             |
dim_patient ─┤
             ├─ fact_hospitalization
dim_doctor  ─┤
             |
        dim_treatment
```

**Table de faits :** `fact_hospitalization`
- Durée de séjour, coût total, score de satisfaction, réadmission

**Tables de dimensions :**
- `dim_patient` — âge, genre, région, type d'assurance
- `dim_doctor` — spécialité, département, ancienneté
- `dim_treatment` — nom, catégorie, durée moyenne
- `dim_date` — date complète, mois, trimestre, année, semaine

---

## Analyses réalisées

| Requête | Description | Concepts SQL |
|---|---|---|
| 1 | CA et durée de séjour par spécialité | `GROUP BY`, `AVG`, `SUM`, `JOIN` |
| 2 | Taux de réadmission par catégorie de traitement | `CASE WHEN`, agrégations conditionnelles |
| 3 | Tendance mensuelle des coûts avec cumul YTD | Window function `SUM OVER`, `PARTITION BY` |
| 4 | Segmentation patients par tranche d'âge et assurance | `CASE WHEN` pour segmentation |
| 5 | Top 3 traitements les plus coûteux par département | `CTE`, `RANK() OVER PARTITION BY` |
| 6 | Alerte satisfaction faible | Filtres multi-tables, tri composite |
| 7 | Dashboard KPIs global | Agrégations multiples en une seule requête |

---

## KPIs suivis

- Nombre total d'hospitalisations et de patients uniques
- Durée moyenne de séjour
- Coût moyen et revenu total par période
- Taux de réadmission global et par traitement
- Score de satisfaction moyen par spécialité

---

## Stack technique

| Outil | Usage |
|---|---|
| SQL (PostgreSQL) | Modélisation, requêtes analytiques, window functions |
| Schéma en étoile | Modélisation dimensionnelle |
| CTEs | Requêtes complexes lisibles |
| Window functions | Calculs cumulatifs et classements |

---

## Structure du projet

```
healthcare-data-analysis/
│
├── README.md
└── sql/
    └── healthcare_analysis.sql   # Schéma + données + requêtes analytiques
```

---

## Comment exécuter

**1. Cloner le dépôt**
```bash
git clone https://github.com/ChristinaPayong/healthcare-data-analysis.git
cd healthcare-data-analysis
```

**2. Créer la base de données (PostgreSQL)**
```bash
psql -U postgres -c "CREATE DATABASE healthcare_db;"
psql -U postgres -d healthcare_db -f sql/healthcare_analysis.sql
```

**3. Explorer les requêtes**

Ouvrir `sql/healthcare_analysis.sql` dans DBeaver, pgAdmin ou tout autre client SQL.

---

## Auteure

**Christina Payong**
Etudiante ingénieure — Big Data & Machine Learning, EFREI Paris
[LinkedIn](https://linkedin.com/in/Christina-Payong) · [GitHub](https://github.com/ChristinaPayong)
