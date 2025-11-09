# Deliverable 2

## ER Diagram

![](../images/erd.png)

## Relational Schema

![](../images/relational-schema.png)

## DDL Script

```sql
-- ============================================================
-- Table: author
-- Description: Stores information about all authors, including
--              their unique identifier and full name.
-- ============================================================
CREATE TABLE author (
    authorid BIGINT PRIMARY KEY,
    authorname VARCHAR(255) NOT NULL
);

-- ============================================================
-- Table: category
-- Description: Stores all research categories (subjects) from arXiv.
--              Each category has a unique code and descriptive name.
-- ============================================================
CREATE TABLE category (
    categorycode VARCHAR(30) PRIMARY KEY,
    categoryname VARCHAR(50) UNIQUE NOT NULL
);

-- ============================================================
-- Table: paper
-- Description: Contains details of each research paper including
--              title, abstract, metadata, and the author who submitted it.
-- Relationships:
--   * submitterid -> author(authorid)
-- ============================================================
CREATE TABLE paper (
    arxivid VARCHAR(10) PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    abstract TEXT NOT NULL,
    license VARCHAR(100),
    doi VARCHAR(255),
    reportno VARCHAR(500),
    journalref TEXT,
    comments TEXT,
    updatedate DATE,
    submitterid INT NOT NULL,
    FOREIGN KEY (submitterid) REFERENCES author(authorid)
);

-- ============================================================
-- Table: version
-- Description: Stores version history for each paper, including
--              version number and submission date.
-- Relationships:
--   * arxivid -> paper(arxivid)
-- ============================================================
CREATE TABLE version (
    arxivid VARCHAR(10) NOT NULL,
    versionno VARCHAR(5),
    createdate DATE,
    PRIMARY KEY (arxivid, versionno),
    FOREIGN KEY (arxivid) REFERENCES paper(arxivid)
);

-- ============================================================
-- Table: paperauthor
-- Description: Many-to-many mapping between papers and authors.
--              Represents all authors who contributed to each paper.
-- Relationships:
--   * arxivid -> paper(arxivid)
--   * authorid -> author(authorid)
-- ============================================================
CREATE TABLE paperauthor (
    arxivid VARCHAR(10),
    authorid INT,
    PRIMARY KEY (arxivid, authorid),
    FOREIGN KEY (arxivid) REFERENCES paper(arxivid),
    FOREIGN KEY (authorid) REFERENCES author(authorid)
);

-- ============================================================
-- Table: papercategory
-- Description: Many-to-many mapping between papers and research categories.
--              Represents all subject areas a paper belongs to.
-- Relationships:
--   * arxivid -> paper(arxivid)
--   * categorycode -> category(categorycode)
-- ============================================================
CREATE TABLE papercategory (
    arxivid VARCHAR(10),
    categorycode VARCHAR(30),
    PRIMARY KEY (arxivid, categorycode),
    FOREIGN KEY (arxivid) REFERENCES paper(arxivid),
    FOREIGN KEY (categorycode) REFERENCES category(categorycode)
);
```
