namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Centre")]
    public partial class Centre
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Centre()
        {
            CentreTestTypeYearlevels = new HashSet<CentreTestTypeYearlevel>();
            CentreContacts = new HashSet<CentreContact>();
        }

        [Key]
        public int PRACentreID { get; set; }

        public int ProjectID { get; set; }

        public int ACARAClientCentreID { get; set; }

        [StringLength(10)]
        public string ClientCentreID { get; set; }

        [Required]
        [StringLength(100)]
        public string CentreName { get; set; }

        [StringLength(100)]
        public string CampusName { get; set; }

        [Required]
        [StringLength(1)]
        public string Sector { get; set; }

        [StringLength(100)]
        public string Location { get; set; }

        public int AddressID { get; set; }

        [StringLength(20)]
        public string TestOrder { get; set; }

        public bool Active { get; set; }

        public bool? CentreDetailsConfirmed { get; set; }

        public bool? ContactDetailsConfirmed { get; set; }

        public bool? ClassScheduleConfirmed { get; set; }

        public virtual Address Address { get; set; }

        public virtual Project Project { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CentreTestTypeYearlevel> CentreTestTypeYearlevels { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CentreContact> CentreContacts { get; set; }
    }
}
