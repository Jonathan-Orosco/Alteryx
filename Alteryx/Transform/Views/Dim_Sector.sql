
CREATE view [Transform].[Dim_Sector]
(
	 [SectorDescription]
	,[CreatedDateUtc]
)
as
	SELECT distinct 
		 [SectorDescription]	= cast([Sector] as [nvarchar](50))
		,[CreatedDateUtc]		= GETUTCDATE()
	FROM 
		[Staging].[companies] as datNw
	where
		not exists
		(
			select null 
			from 
				[dbo].[Dim_Sector] as defInd
			where
				datNw.Sector = defInd.SectorDescription
		)