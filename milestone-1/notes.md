# Deliverable 1

## Problem Statement

**Title: Designing a Relational Database for Analyzing Research Collaboration and Publication Trends Using Scholarly Metadata from arXiv**

### Objective

To design a relational database that stores and enables analysis of arXiv research paper data to discover insights about author collaborations, research category trends, and the evolution of publications over time.

## Dataset Description

**Link to Dataset:** https://huggingface.co/datasets/CShorten/ML-ArXiv-Papers, https://www.kaggle.com/datasets/Cornell-University/arxiv

The dataset contains about 2 million research papers collected from arXiv. Each paper record includes basic details such as paper ID, title, authors, abstract, and research categories. It also provides extra information like comments, journal references, DOIs, report numbers, and licenses (though many of these are missing for some papers). The dataset also includes the date when each paper was last updated, and structured details about versions and authors. 

### Sample Data Instance

```json
{
  "id": "0704.0001",
  "submitter": "Pavel Nadolsky",
  "authors": "C. Balázs, E. L. Berger, P. M. Nadolsky, C.-P. Yuan",
  "title": "Calculation of prompt diphoton production cross sections at Tevatron and LHC energies",
  "comments": "37 pages, 15 figures; published version",
  "journal-ref": "Phys.Rev.D76:013009,2007",
  "doi": "10.1103/PhysRevD.76.013009",
  "report-no": "ANL-HEP-PR-07-12",
  "categories": "hep-ph",
  "license": null,
  "abstract": "A fully differential calculation in perturbative quantum chromodynamics is presented for the production of massive photon pairs...",
  "versions": [
    { "version": "v1", "created": "Mon, 2 Apr 2007 19:18:42 GMT" },
    { "version": "v2", "created": "Tue, 24 Jul 2007 20:10:27 GMT" }
  ],
  "update_date": "2008-11-26",
  "authors_parsed": [
    ["Balázs", "C.", ""],
    ["Berger", "E. L.", ""],
    ["Nadolsky", "P. M.", ""],
    ["Yuan", "C.-P.", ""]
  ]
}
```

### Data Fields

* **id:** ArXiv ID (can be used to access the paper)
* **submitter:** Who submitted the paper
* **authors:** Authors of the paper
* **title:** Title of the paper
* **comments:** Additional info, such as number of pages and figures
* **journal-ref:** Information about the journal the paper was published in
* **doi:** Digital Object Identifier
* **report-no:** Report Number
* **abstract:** The abstract of the paper
* **categories:** Categories / tags in the ArXiv system
* **versions:** A version history

## Analytical Queries

1. Average number of co-authors per paper across categories.
2. Average time between initial submission and last update.
3. Authors who frequently publish together.
4. Authors with the longest active publishing span.
5. Categories that frequently appear together.
6. Category-wise yearly publication count.
7. Keyword frequency (“deep learning”) by year.
8. Most common submission months/days.
9. Number of distinct categories per author.
10. Percentage of papers updated more than once.
11. Proportion of single-author vs multi-author papers.
12. Submitters who stop contributing after 5 years.
13. Top author by number of papers.
14. Top submitters by number of papers.
