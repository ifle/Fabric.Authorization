﻿using System.Collections.Generic;

namespace Fabric.Authorization.Domain.Resolvers.Models
{
    public class PermissionResolutionRequest
    {
        public string Grain { get; set; }
        public string SecurableItem { get; set; }
        public string IdentityProvider { get; set; }
        public string SubjectId { get; set; }
        public bool IncludeSharedPermissions { get; set; }
        public IEnumerable<string> UserGroups { get; set; } = new List<string>();
    }
}