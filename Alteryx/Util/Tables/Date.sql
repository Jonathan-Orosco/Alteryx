CREATE TABLE [Util].[Date] (
    [DateId]     INT     IDENTITY (1, 1) NOT NULL,
    [StdDate]    DATE    NOT NULL,
    [IsWeekend]  BIT     NOT NULL,
    [YearNum]    INT     NULL,
    [MonthNum]   TINYINT NULL,
    [QuarterNum] TINYINT NULL,
    CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED ([DateId] ASC)
);

