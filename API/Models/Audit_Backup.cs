namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Audit_Backup
    {
        [Key]
        [Column(Order = 0)]
        public int AuditID { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime DateTimeModified { get; set; }

        [Key]
        [Column(Order = 2)]
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

        [Key]
        [Column(Order = 3)]
        [StringLength(1)]
        public string Action { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(100)]
        public string Username { get; set; }
    }
}
