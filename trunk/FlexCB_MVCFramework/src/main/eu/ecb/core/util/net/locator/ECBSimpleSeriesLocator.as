// Copyright (C) 2010 European Central Bank. All rights reserved.
//
// Redistribution and use in source and binary forms,
// with or without modification, are permitted
// provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
// Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation
// and/or other materials provided with the distribution.
// Neither the name of the European Central Bank
// nor the names of its contributors may be used to endorse or promote products
// derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
package eu.ecb.core.util.net.locator
{
	import flash.net.URLRequest;

	/**
	 * This locator returns the expected file location of data represented by a
	 * particular series keys (e.g.: M.DE.0000.N). This locator expects to 
	 * find the data file below a data folder, uses the series key as file 
	 * name where . are replaced by _ and appends the .xml extension 
	 * (e.g.: data/M_DE_0000_N.xml).
	 * 
	 * @author Xavier Sosnovsky
	 */ 
	public class ECBSimpleSeriesLocator implements ISeriesLocator
	{
		/*==============================Fields================================*/
		
		private var _isCompressed:Boolean;
		
		/*===========================Constructor==============================*/
		
		public function ECBSimpleSeriesLocator()
		{
			super();
		}

		/*============================Accessors===============================*/
		
		/**
		 * @inheritDoc
		 */ 
		public function set dataflowId(id:String):void
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function set isCompressed(flag:Boolean):void
		{
			_isCompressed = flag;
		}
		
		/*==========================Public methods============================*/

		/**
		 * @inheritDoc
		 */
		public function getFileForSeries(seriesKey:String):URLRequest
		{
			var extension:String = _isCompressed ? ".xml.zlib" : ".xml";
			return new URLRequest("data/" + seriesKey.replace(/\./g, "_") + 
				extension); 
		}
	}
}