﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GA.Nucleus.Chromosome;

namespace GA.Nucleus.Population {
	public interface IPopulation {
		
		#region Properties

		IPopulationManager Manager { get; set; }
		List<IKaryotype> Karyotypes { get; set; }

		#endregion Properties

		#region Methods 

		void InitializePopulation(IPopulationManager ipo);
		void Evolve();
		IKaryotype ChooseFitKaryotype();
        List<IKaryotype> GetUniqueKaryotypes(); 

		#endregion Methods
	}
}
