﻿using GA.Nucleus.Gene;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GA.Nucleus.Chromosome {
	public class DefaultHaploid : Dictionary<string, IChromosome>, IHaploid {

		#region ctor

		public DefaultHaploid(){}

		#endregion ctor

		#region IHaploid

        public string ChromosomeSequence() {
            StringBuilder sbChromo = new StringBuilder();
            foreach (KeyValuePair<string, IChromosome> chromoPair in this) {
                if (sbChromo.Length > 0)
                    sbChromo.Append(",");
                sbChromo.AppendFormat("{{\"{0}\":[{1}]}}", chromoPair.Key, chromoPair.Value.GeneSequence());
            }

            return string.Format("{{\"sequence\":[{0}]}}", sbChromo.ToString());
		}

		#endregion IHaploid

		#region ICloneable

		public object Clone() {
			IHaploid cloner = (IHaploid)Activator.CreateInstance(this.GetType());
			foreach (KeyValuePair<string, IChromosome> kvp in this)
				cloner.Add(kvp.Key, (IChromosome)kvp.Value.Clone());
			return cloner;
		}

		#endregion ICloneable
	}
}
