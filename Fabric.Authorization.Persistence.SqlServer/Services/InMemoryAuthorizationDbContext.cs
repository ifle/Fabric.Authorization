﻿using Fabric.Authorization.Domain.Services;
using Fabric.Authorization.Persistence.SqlServer.Configuration;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace Fabric.Authorization.Persistence.SqlServer.Services
{
    public class InMemoryAuthorizationDbContext : AuthorizationDbContext
    {
        public InMemoryAuthorizationDbContext(IEventContextResolverService eventContextResolverService, ConnectionStrings connectionStrings, ILoggerFactory loggerFactory) 
            : base(eventContextResolverService, connectionStrings, loggerFactory)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseInMemoryDatabase(databaseName: ConnectionStrings.AuthorizationDatabase);
        }
    }
}
