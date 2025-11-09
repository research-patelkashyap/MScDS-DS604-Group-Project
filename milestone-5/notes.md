# Deliverable 5

* Save some queries as views.
* **Jupyter Notebook in PDF form**

## Queries

### Views

#### Frequent Collaborators
```sql
CREATE MATERIALIZED VIEW mv_frequent_collaborators AS
SELECT
    a1.authorid AS author1_id,
    a1.authorname AS author1_name,
    a2.authorid AS author2_id,
    a2.authorname AS author2_name,
    COUNT(*) AS papers_together
FROM paperauthor pa1
JOIN paperauthor pa2
    ON pa1.arxivid = pa2.arxivid AND pa1.authorid < pa2.authorid
JOIN author a1 ON pa1.authorid = a1.authorid
JOIN author a2 ON pa2.authorid = a2.authorid
GROUP BY a1.authorid, a1.authorname, a2.authorid, a2.authorname;
```

#### Paper and All Metadata Combined
```sql
CREATE MATERIALIZED VIEW mv_paper_full AS
SELECT
    p.arxivid,
    p.title,
    p.abstract,
    p.updatedate,
    p.submitterid,
    a.authorname AS submitter_name,
    categorycode,
    categoryname
FROM paper p
JOIN author a ON p.submitterid = a.authorid
NATURAL JOIN papercategory
NATURAL JOIN category;
```

### Queries

#### All authors who frequently collaborated with `Yoshua Bengio`, sorted by the number of papers they co-authored together.

```sql
SELECT author1_name, author2_name, papers_together
FROM mv_frequent_collaborators
WHERE author1_name = :name
ORDER BY papers_together DESC;
```

#### Authors publishing the most deep learning papers.
```sql
SELECT
    authorid,
    authorname,
    COUNT(DISTINCT arxivid) AS deep_learning_papers
FROM mv_paper_full
NATURAL JOIN paperauthor
NATURAL JOIN author
WHERE 
    (LOWER(title) LIKE '%deep learning%' 
    OR LOWER(abstract) LIKE '%deep learning%')
    AND categorycode IN ('cs.AI', 'cs.CL', 'cs.CV', 'cs.LG', 'cs.IR', 'cs.NE')
GROUP BY authorid, authorname
ORDER BY deep_learning_papers DESC;
```
