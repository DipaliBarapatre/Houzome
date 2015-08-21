var MasterDesign = React.createClass({
	getInitialState: function(){
		return {
			searchData: {towers: [], flatnos: []},
			tower: '',
			flat: '',
			designs: []
		}
	},

	loadSearchdata: function(){
		return $.get("/api/apartments/" + window.apartment_id);
	},

	designUrl: function(bhk){
	
	},

	loadDesigns: function(bhk){
		$.get("/api/apartments/" + window.apartment_id + "/designs?flat="+ bhk, function(designs){
			this.setState({
				designs: designs
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

	render: function(){
		var designs = this.state.designs.map(function(design){
			return <Design design={design} />;
		}.bind(this));

		return(
			<div>
		        <Search/>
		        <div id="apartments" className="padder">
		        	{designs}
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
		return(
			<div className="search-tools">
			  <div className="search-field">
			  	<label htmlFor="tower">Tower</label>
			  	<select name="tower" id="tower" style={tower_style}></select>
			  </div>
			  <div className="search-field last">
			  	<label htmlFor="flat">Flat No</label>
			  	<select name="flat" id="flat" style={tower_style}> 
			  	</select>
			  </div>
			</div>
		);
	}
})

var Design = React.createClass({
	render: function(){

		return(
			<div className="each">
				<div className="hover-tile-outer">
				  <div className="hover-tile-container">
				    <div className="hover-tile hover-tile-visible"></div>
				    <div className="hover-tile hover-tile-hidden">
				      <h4>{this.props.design.name}</h4>
				      <p></p>
				    </div>
				  </div>
				</div>
			</div>
		);
	}
})

var masterDesign = React.render(
	<MasterDesign />,
	document.getElementById('master-design')
)
