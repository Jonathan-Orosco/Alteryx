


CREATE view [Transform].[Dim_Ticker]
(
	 [TickerCode]
	,[CreatedDateUtc]
)
as
	SELECT distinct 
		 [TickerCode]			= cast([Ticker] as [nvarchar](10))
		,[CreatedDateUtc]		= GETUTCDATE()
	FROM 
		[Staging].[companies] as datNw
	where
		not exists
		(
			select null 
			from 
				[dbo].[Dim_Ticker] as defInd
			where
				datNw.[Ticker] = defInd.[TickerCode]
		)