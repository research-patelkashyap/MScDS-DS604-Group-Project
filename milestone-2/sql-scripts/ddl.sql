CREATE TABLE author (
    authorid BIGINT PRIMARY KEY,
    authorname VARCHAR(255) NOT NULL
);

-- =========

CREATE TABLE category (
    categorycode VARCHAR(30) PRIMARY KEY,
    categoryname VARCHAR(50) UNIQUE NOT NULL
);

-- =========

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

-- =========

CREATE TABLE version (
    arxivid VARCHAR(10) NOT NULL,
    versionno VARCHAR(5),
    createdate DATE,
    PRIMARY KEY (arxivid, versionno),
    FOREIGN KEY (arxivid) REFERENCES paper(arxivid)
);

-- =========

CREATE TABLE paperauthor (
    arxivid VARCHAR(10),
    authorid INT,
    PRIMARY KEY (arxivid, authorid),
    FOREIGN KEY (arxivid) REFERENCES Paper(arxivid),
    FOREIGN KEY (authorid) REFERENCES Author(authorid)
);

-- =========

CREATE TABLE papercategory (
    arxivid VARCHAR(10),
    categorycode VARCHAR(30),
    PRIMARY KEY (arxivid, categorycode),
    FOREIGN KEY (arxivid) REFERENCES paper(arxivid),
    FOREIGN KEY (categorycode) REFERENCES category(categorycode)
);
