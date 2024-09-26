CREATE OR REPLACE PROCEDURE COUNT_TOTAL(
    STD_ID IN NUMBER,
    TOTAL OUT NUMBER
) AS
    V_ATTENDANCE NUMBER(3);
    V_QUIZ       NUMBER(3);
    V_MID        NUMBER(3);
    V_FINALS     NUMBER(3);
BEGIN
    SELECT
        ATTENDANCE,
        QUIZ,
        MID,
        FINALS INTO V_ATTENDANCE,
        V_QUIZ,
        V_MID,
        V_FINALS
    FROM
        RESULTS_TABLE
    WHERE
        ID = STD_ID;
    TOTAL := V_ATTENDANCE*0.1 + V_QUIZ * 0.15 + V_MID * 0.25 + V_FINALS * 0.5;
 
    -- DBMS_OUTPUT.PUT_LINE(V_ATTENDANCE
    --                      || ' '
    --                      || V_QUIZ
    --                      || ' '
    --                      || V_MID
    --                      || ' '
    --                      || V_FINALS);
    -- DBMS_OUTPUT.PUT_LINE('Total marks of student '
    --                      || STD_ID
    --                      || ' is '
    --                      || TOTAL);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No records found for student ID: '
                             || STD_ID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: '
                             || SQLERRM);
END COUNT_TOTAL;
/

DECLARE
    TOTAL NUMBER(3);
BEGIN
    COUNT_TOTAL(1, TOTAL);
    DBMS_OUTPUT.PUT_LINE('The total marks are: '
                         || TOTAL);
END;
/