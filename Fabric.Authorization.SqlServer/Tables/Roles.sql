CREATE TABLE [dbo].[Roles](
	[RoleId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DisplayName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Grain] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedDateTimeUtc] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](max) NULL,
	[ModifiedDateTimeUtc] [datetime] NULL,
	[ParentRoleId] [uniqueidentifier] NULL,
	[SecurableItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [HCFabricAuthorizationData1]
) ON [HCFabricAuthorizationData1] TEXTIMAGE_ON [HCFabricAuthorizationData1]
GO

CREATE UNIQUE CLUSTERED INDEX [IX_Roles_Id] ON [dbo].[Roles]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [HCFabricAuthorizationData1]
GO

CREATE NONCLUSTERED INDEX [IX_Roles_ParentRoleId] ON [dbo].[Roles]
(
	[ParentRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [HCFabricAuthorizationIndex1]
GO

CREATE NONCLUSTERED INDEX [IX_Roles_SecurableItemId] ON [dbo].[Roles]
(
	[SecurableItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [HCFabricAuthorizationIndex1]
GO

ALTER TABLE [dbo].[Roles] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO

ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Roles_ParentRoleId] FOREIGN KEY([ParentRoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO

ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Roles_ParentRoleId]
GO

ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_SecurableItems_SecurableItemId] FOREIGN KEY([SecurableItemId])
REFERENCES [dbo].[SecurableItems] ([SecurableItemId])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_SecurableItems_SecurableItemId]
GO
