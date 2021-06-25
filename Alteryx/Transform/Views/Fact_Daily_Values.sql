
CREATE view [Transform].[Fact_Daily_Values]
(
	 [TickerMapId]	
	,[MarketDate]	
	,[OpenValue]	
	,[CloseValue]
	,[HighValue]	
	,[LowValue]		
	,[Volume]		
)
as

SELECT 
	 [TickerMapId]				= mapDly.[TickerMapId]
	,[MarketDate]				= defcol.[MarketDate]
	,[OpenValue]				= cast([OpenValue] as money)
	,[CloseValue]				= cast([CloseValue] as money)
	,[HighValue]				= cast([HighValue] as money)
	,[LowValue]					= cast([LowValue] as money)
	,[Volume]					= cast([Volume] as int)
FROM 
	[Staging].[DailyValues] as datDly
	cross apply
	(
	select 
		[MarketDate] = cast([MarketDate] as date)
	)as defcol
	inner join
	[dbo].[Dim_Ticker] as defTck
	on datDly.TickerSymbol = defTck.TickerCode
	inner join
	[dbo].[Map_Ticker] as mapDly
	on defTck.TickerId = mapDly.TickerId
		and defcol.[MarketDate] between mapDly.StartDateUtc and isnull( mapDly.EndDateUtc, getutcdate())
where 
	not exists
	(
		select null 
		from 
			[dbo].[Fact_Daily_Values] as datExst
		where 
			mapDly.TickerMapId = datExst.TickerMapId
			and defcol.[MarketDate] = datExst.MarketDate
	)