
CREATE view [Transform].[Dim_Industry]
(
	 [IndustryDescription]
	,[CreatedDateUtc]
)
as
	SELECT distinct 
		 [IndustryDescription]	= cast([industry] as [nvarchar](50))
		,[CreatedDateUtc]		= GETUTCDATE()
	FROM 
		[Staging].[companies] as datNw
	where
		not exists
		(
			select null 
			from 
				[dbo].[Dim_Industry] as defInd
			where
				datNw.industry = defInd.IndustryDescription
		)