# Query Results — Healthcare Data Analysis

Résultats des requêtes analytiques exécutées sur le dataset hospitalier 2024.

---

## Query 1 — Coût et durée de séjour par spécialité

| Specialty | Total Hospitalizations | Avg Length of Stay | Avg Cost | Total Revenue |
|---|---|---|---|---|
| Oncology | 4 | 7.5 | 13100.00 | 52400.00 |
| Orthopedics | 4 | 8.2 | 15475.00 | 61900.00 |
| Cardiology | 4 | 5.5 | 8900.00 | 35600.00 |
| Neurology | 4 | 3.2 | 4300.00 | 17200.00 |
| Pulmonology | 4 | 3.7 | 4950.00 | 19800.00 |
| Endocrinology | 3 | 2.6 | 2766.67 | 8300.00 |
| Gastrology | 2 | 1.0 | 1700.00 | 3400.00 |
| Dermatology | 2 | 5.5 | 7000.00 | 14000.00 |

**Insight** : L'orthopédie et l'oncologie génèrent les coûts les plus élevés par séjour. La gastroentérologie présente les séjours les plus courts (1 jour en moyenne).

---

## Query 2 — Taux de réadmission par catégorie de traitement

| Treatment Category | Total Cases | Readmissions | Readmission Rate (%) |
|---|---|---|---|
| Pulmonology | 3 | 2 | 66.7 |
| Orthopedic surgery | 4 | 2 | 50.0 |
| Dermatology | 2 | 1 | 50.0 |
| Oncology | 3 | 1 | 33.3 |
| Interventional cardiology | 3 | 0 | 0.0 |
| Diagnostic neurology | 3 | 0 | 0.0 |
| Endocrinology | 3 | 0 | 0.0 |
| Gastroenterology | 2 | 0 | 0.0 |

**Insight** : La pneumologie et la chirurgie orthopédique affichent les taux de réadmission les plus élevés. Ces spécialités méritent une attention particulière dans le suivi post-hospitalisation.

---

## Query 3 — Tendance mensuelle des coûts avec cumul YTD

| Year | Month | Monthly Cost | Cumulative Cost YTD |
|---|---|---|---|
| 2024 | 1 | 20900.00 | 20900.00 |
| 2024 | 2 | 22500.00 | 43400.00 |
| 2024 | 3 | 19800.00 | 63200.00 |
| 2024 | 4 | 16000.00 | 79200.00 |
| 2024 | 5 | 19000.00 | 98200.00 |
| 2024 | 6 | 17800.00 | 116000.00 |
| 2024 | 7 | 24400.00 | 140400.00 |
| 2024 | 8 | 18200.00 | 158600.00 |
| 2024 | 9 | 14600.00 | 173200.00 |
| 2024 | 10 | 20000.00 | 193200.00 |

**Insight** : Le coût cumulé YTD dépasse 193 000 € en octobre 2024. Le pic de juillet s'explique par des hospitalisations longues en chirurgie orthopédique.

---

## Query 4 — Segmentation patients par tranche d'âge et type d'assurance

| Age Group | Insurance Type | Hospitalizations | Avg Cost | Avg Satisfaction |
|---|---|---|---|---|
| 18-39 | Private | 3 | 7433.33 | 4.3 |
| 18-39 | Public | 4 | 4125.00 | 4.0 |
| 40-59 | Complementary | 3 | 6566.67 | 4.7 |
| 40-59 | Private | 3 | 8200.00 | 3.7 |
| 40-59 | Public | 3 | 5566.67 | 4.3 |
| 60+ | Complementary | 2 | 9400.00 | 3.5 |
| 60+ | Public | 5 | 9580.00 | 3.8 |

**Insight** : Les patients 60+ en assurance publique représentent la part la plus coûteuse. La satisfaction est plus faible chez les patients âgés, suggérant un besoin d'amélioration du suivi post-soin.

---

## Query 5 — Top 3 traitements les plus coûteux par département

| Department | Treatment | Avg Cost | Cases |
|---|---|---|---|
| Cancer Center | Chemotherapy cycle | 13100.00 | 4 |
| Dermatology | Biologic therapy | 7000.00 | 2 |
| Digestive System | Colonoscopy | 1700.00 | 2 |
| Internal Medicine | Coronary angioplasty | 8900.00 | 4 |
| Internal Medicine | Respiratory therapy | 4950.00 | 3 |
| Internal Medicine | Insulin management | 2766.67 | 3 |
| Neurosciences | MRI + neurological eval | 4300.00 | 4 |
| Surgery | Hip replacement | 15475.00 | 4 |

**Insight** : La chirurgie orthopédique (hip replacement) est le traitement le plus coûteux toutes spécialités confondues, suivi de la chimiothérapie.

---

## Query 6 — Patients à satisfaction faible (score ≤ 3)

| Patient ID | Age | Region | Specialty | Treatment | Score | Readmission | Cost |
|---|---|---|---|---|---|---|---|
| 2 | 62 | Auvergne-Rhône-Alpes | Oncology | Chemotherapy cycle | 3 | Yes | 12400.00 |
| 5 | 29 | Hauts-de-France | Pulmonology | Respiratory therapy | 3 | Yes | 4800.00 |
| 8 | 67 | PACA | Dermatology | Biologic therapy | 3 | Yes | 7200.00 |
| 10 | 59 | Normandie | Oncology | Chemotherapy cycle | 4 | No | 13800.00 |
| 12 | 62 | Auvergne-Rhône-Alpes | Orthopedics | Hip replacement | 2 | Yes | 14200.00 |
| 16 | 55 | Bretagne | Dermatology | Biologic therapy | 3 | Yes | 6800.00 |
| 20 | 59 | Normandie | Orthopedics | Hip replacement | 3 | Yes | 3900.00 |

**Insight** : Les patients insatisfaits sont systématiquement réadmis. La corrélation entre faible satisfaction et réadmission suggère un manque de suivi post-opératoire.

---

## Query 7 — KPI Dashboard global

| KPI | Valeur |
|---|---|
| Total hospitalisations | 20 |
| Patients uniques | 10 |
| Durée moyenne de séjour | 4.7 jours |
| Coût moyen par séjour | 7 955.00 € |
| Revenu total | 159 100.00 € |
| Taux de réadmission global | 35.0 % |
| Score de satisfaction moyen | 3.9 / 5 |

**Insight** : Avec un taux de réadmission de 35% et un score de satisfaction de 3.9/5, deux axes d'amélioration prioritaires se dégagent : réduire les réadmissions en chirurgie et pneumologie, et améliorer le suivi patient post-hospitalisation.
