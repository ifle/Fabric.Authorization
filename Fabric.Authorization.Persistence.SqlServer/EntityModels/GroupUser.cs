﻿using System;
using Fabric.Authorization.Domain.Models;

namespace Fabric.Authorization.Persistence.SqlServer.EntityModels
{
    public class GroupUser : ITrackable, ISoftDelete
    {
        public int Id { get; set; }
        public string SubjectId { get; set; }
        public string IdentityProvider { get; set; }
        public Guid GroupId { get; set; }

        public DateTime CreatedDateTimeUtc { get; set; }
        public DateTime? ModifiedDateTimeUtc { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public bool IsDeleted { get; set; }

        public User User { get; set; }
        public Group Group { get; set; }
    }
}