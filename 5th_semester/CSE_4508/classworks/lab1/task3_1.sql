CREATE OR REPLACE RESULTS_TABLE (
    ID NUMBER(9) PRIMARY KEY,
    ATTENDANCE NUMBER(3),
    QUIZ NUMBER(3),
    MID NUMBER(3),
    FINALS NUMBER(3),
    TOTAL NUMBER(3),
    GRADE VARCHAR2(1)
)
INSERT INTO RESULTS_TABLE (ID, ATTENDANCE, QUIZ, MID, FINALS)
VALUES (1, 85, 78, 80, 90);

INSERT INTO RESULTS_TABLE (
    ID,
    ATTENDANCE,
    QUIZ,
    MID,
    FINALS
) VALUES (
    2,
    90,
    88,
    85,
    92
);

INSERT INTO RESULTS_TABLE (
    ID,
    ATTENDANCE,
    QUIZ,
    MID,
    FINALS
) VALUES (
    3,
    75,
    65,
    70,
    80
);

INSERT INTO RESULTS_TABLE (
    ID,
    ATTENDANCE,
    QUIZ,
    MID,
    FINALS
) VALUES (
    4,
    80,
    82,
    78,
    85
);

INSERT INTO RESULTS_TABLE (
    ID,
    ATTENDANCE,
    QUIZ,
    MID,
    FINALS
) VALUES (
    5,
    95,
    90,
    92,
    96
);