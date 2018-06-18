namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CentreTestTypeYearlevel")]
    public partial class CentreTestTypeYearlevel
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int PRACentreID { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int TestTypeID { get; set; }

        public int? ClassID { get; set; }

        public int? Total { get; set; }

        public int? NumberOfDevices { get; set; }

        [StringLength(250)]
        public string Comments { get; set; }

        public virtual Centre Centre { get; set; }

        public virtual Class Class { get; set; }

        public virtual TestType TestType { get; set; }
    }
}
