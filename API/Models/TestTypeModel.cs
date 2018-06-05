namespace API.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TestType")]
    public partial class TestTypeModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TestTypeModel()
        {
            CentreTestTypeYearlevels = new HashSet<CentreTestTypeYearlevelModel>();
        }

        public int TestTypeID { get; set; }

        [Required]
        [StringLength(50)]
        public string TestTypeDescription { get; set; }

        [Required]
        [StringLength(50)]
        public string YearLevel { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CentreTestTypeYearlevelModel> CentreTestTypeYearlevels { get; set; }
    }
}
