var MasterDesign = React.createClass({
	getInitialState: function(){
		return {
			searchData: {towers: [], flatnos: []},
			tower: '',
			flat: '',
			designs: [],
			tower_id: '',
			flat_id: '',
			floor_plan: ''
		}
	},

	loadSearchdata: function(){
		return $.get("/api/apartments/" + window.apartment_id);
	},

	designUrl: function(bhk){
	
	},

	loadDesigns: function(bhk){
		$.get("/api/apartments/" + window.apartment_id + "/designs?tower=" + this.state.tower_id + "&flat="+ bhk, function(data){
			this.setState({
				designs: data.designs[0],
				flat_id: bhk,
				floor_plan: data.designs[1].image_url
			});
		}.bind(this));
	},

	componentDidMount: function(){
		$.get("/api/apartments/" + window.apartment_id, function(data){
			this.setState({
				searchData: data.apartments,
			}, function(){
				$tower = $('#tower').selectize({
				 valueField: 'tower',
				 labelField: 'tower',  
				 options: this.state.searchData,
				 onChange: function(val){
				 	this.state.searchData.map(function(dat){
				 		if(dat.tower == val){
				 			this.state.flat.clearOptions();
 							this.state.flat.addOption(dat.flats);	
				 			this.state.flat.refreshOptions();	
				 			this.state.flat.enable();
				 			this.state.flat.open();
				 			this.setState({
				 				tower_id: dat.tower
				 			})
				 		}
				 	}.bind(this))
				 }.bind(this)
				});

			}.bind(this));

			$flat = $('#flat').selectize({
			 valueField: 'key',
			 labelField: 'val',  
			 options: this.state.searchData,
			 onChange: function(val){
			 	this.loadDesigns(val);
			 }.bind(this)
			});

			this.setState({
				flat: $flat[0].selectize,
				tower: $tower[0].selectize
			});

			this.state.flat.disable();
			this.state.tower.open();
		}.bind(this));
	},

	customDesign: function(){
		window.location.replace('/custom/design?apartment=' + window.apartment_id + '&tower=' + this.state.tower_id + '&flat=' + this.state.flat_id)
	},

	render: function(){
		var designs = this.state.designs.map(function(design){
			return <Design design={design} tower={this.state.tower_id} flat={this.state.flat_id}/>;
		}.bind(this));

		return(
			<div>
		        <Search floor_plan={this.state.floor_plan} flat={this.state.flat_id} tower={this.state.tower_id}/>
		        <div className="padder">
		        	<h4>Design Solutions for your House</h4>
		        	<div id="apartments">
		        		{designs}
		        		<div className="each custom" onClick={this.customDesign}>
		        			<img src="/assets/retro-pattern-f10fc06d3c75eb867d71d8b2f1603ce9793739365eef5a0164f77c175f54564f.jpg" alt="Retro pattern" />
		        			<div className="plus">
		        				<p>Custom Design</p>
		        			</div>
		        		</div>
		        	</div>
		        </div>
		    </div>
		);
	}
})


var Search = React.createClass({
	handler: function(){
		debugger;
	},

	render: function(){
		var tower_style = {
			display: 'none'
		};

		var floor_style = {
			display: (this.props.flat == "") ? "none" : 'block'
		};

		return(
			<div className="search-tools">
			  <div className="search-field">
			  	<label htmlFor="tower">Tower</label>
			  	<select name="tower" id="tower" style={tower_style}></select>
			  </div>
			  <div className="search-field">
			  	<label htmlFor="flat">Flat No</label>
			  	<select name="flat" id="flat" style={tower_style}> 
			  	</select>
			  </div>
			  <div className="search-field last" style={floor_style}>
			  	<label>Floor Plan ({this.props.tower}, {this.props.flat})</label>
			  	<image src={this.props.floor_plan} data-action='zoom' />
			  </div>
			</div>
		);
	}
})

var Design = React.createClass({
	handler: function(a){
		window.open('/designs/' + a.target.dataset.url + '?apartment=' + window.apartment_id + '&tower=' + this.props.tower + '&flat=' + this.props.flat, '_blank')
	},

	render: function(){
		var box_style = {
			backgroundImage: 'url(' + this.props.design.image_url + ')',
		};
		var paraStyle = {textAlign: 'center', color: 'rgba(51,51,51,0.7)'};

		return(
			<div className="each" onClick={this.handler} data-url={this.props.design.slug}>
				<div className="hover-tile-outer" style={box_style} data-url={this.props.design.slug}>
				  <div className="hover-tile-container" data-url={this.props.design.slug}>
				    <div className="hover-tile hover-tile-visible"></div>
				    <div data-url={this.props.design.slug} className="hover-tile hover-tile-hidden">
				      <h4 data-url={this.props.design.slug} className='design-name'>{this.props.design.name}</h4>
				      <p></p>
				    </div>
				  </div>
				  <p style={paraStyle} >INR {this.props.design.selling_price}</p>
				</div>
			</div>
		);
	}
})

var masterDesign = React.render(
	<MasterDesign />,
	document.getElementById('master-design')
)
