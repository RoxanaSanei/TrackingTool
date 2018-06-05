namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Audit")]
    public partial class AuditModel
    {
        public int AuditID { get; set; }

        public DateTime DateTimeModified { get; set; }

        [Required]
        [StringLength(50)]
        public string AuditTableName { get; set; }

        [StringLength(255)]
        public string ChangedColumns { get; set; }

        [StringLength(1000)]
        public string OldValue { get; set; }

        [StringLength(1000)]
        public string NewValue { get; set; }

        [StringLength(100)]
        public string PK_ID { get; set; }

        [Required]
        [StringLength(1)]
        public string Action { get; set; }

        [Required]
        [StringLength(100)]
        public string Username { get; set; }
    }
}
