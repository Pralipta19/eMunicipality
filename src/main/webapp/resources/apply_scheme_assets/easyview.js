(function($){
	$.fn.easyView = function(option, value){
		var selector = $(this.selector);

		if(typeof selector.data('easyView') == 'undefined'){
			/* First execution */
			if(typeof option == 'string'){
				option = {};
			}

			var plugin = {
				selector: selector,
				currentRatio: 100,
				normalContrast: true,
				defaults: {
					container: 'body',
					tags: ['h1','h2','h3','h4','h5','h6', 'div', 'p', 'a', 'span', 'strong', 'em', 'ul', 'ol', 'li'],
					step: 5,
					bootstrap: true,
					defaultMarkup: '<a href="#decrease" class="decrease-text">Decrease font size</a><a href="#normal" class="reset-text">Normal font size</a><a href="#increase" class="increase-text">Increase font size</a><a href="#contrast" class="contrast-text">Change contrast</a>',
					increaseSelector: '.increase-text',
					decreaseSelector: '.decrease-text',
					normalSelector: '.reset-text',
					contrastSelector: '.contrast-text'
				},
				options: {},
				affectedTags: new Array(),
				mergeOptions: function(option){
					$.extend(this.options, this.defaults, option)
				},
				storeDefaults: function(){
					/* Store default values for each elements */
					$.each(this.affectedTags, function(elIndex, elValue){
						$(elValue).each(function(){
							var current_tag = $(this);
							var font_size = current_tag.css('font-size');

							if(font_size.indexOf('%') > -1){
								/* Percentage */
								current_tag.data('originalSize', parseInt(font_size.replace('%','')));
								current_tag.data('originalUnit', '%');
							} else {
								/* Other units */
								current_tag.data('originalSize', parseInt(font_size.replace(font_size.substr(-2),'')));
								current_tag.data('originalUnit', font_size.substr(-2));
							}

							current_tag.data('originalBackground', current_tag.css('background-color'));
							current_tag.data('originalColor', current_tag.css('color'));
						});
					});

					/* Container default values */
					$(this.options.container).data('originalBackground', $(this.options.container).css('background-color'));
					$(this.options.container).data('originalColor', $(this.options.container).css('color'));
				},
				createDefaultMarkup: function(){
					/* Create a default markup */
					if(selector.html() == ''){
						selector.html(this.options.defaultMarkup);
					}
				},
				setActions: function(){
					var self = this;

					/* Decrease font size */
					selector.find(this.options.decreaseSelector).click(function(ev){
						ev.preventDefault();
						self.decreaseFont();
					});

					/* Reset font size */
					selector.find(this.options.normalSelector).click(function(ev){
						ev.preventDefault();
						self.resetFont();
					});

					/* Increase font size */
					selector.find(this.options.increaseSelector).click(function(ev){
						ev.preventDefault();
						self.increaseFont();
					});

					/* Change text contrast */
					selector.find(this.options.contrastSelector).click(function(ev){
						ev.preventDefault();
						self.changeContrast();
					});
				},
				fetchTags: function(){
					/* Fetching all tags to work */
					var affectedTags = this.affectedTags;
					var options = this.options;
					$.each(this.options.tags, function(i, v){
						affectedTags.push(options.container+" "+v);
					});
				},
				decreaseFont: function(){
					//alert(this.currentRatio - this.options.step);
					if((this.currentRatio - this.options.step) >= 70){
						this.currentRatio = this.currentRatio - this.options.step;
					}
					else if((this.currentRatio - this.options.step) == 65){
						alert("You Have Reached Maximum Decrement of Text Size");
					}
					this.changeFontSize();
				},
				resetFont: function(){
					/* Set default ratio */
					this.currentRatio = 100;
					this.changeFontSize();
				},
				increaseFont: function(){
					//alert(this.currentRatio + this.options.step);
					if((this.currentRatio + this.options.step) <= 130){
						this.currentRatio = this.currentRatio + this.options.step;
					}
					else if((this.currentRatio + this.options.step) == 135){
						alert("You Have Reached Maximum Increment of Text Size");
					}
					
					this.changeFontSize();
				},
				changeFontSize: function(ratio){
					if(typeof ratio != 'undefined' && parseInt(ratio) > 10){
						this.currentRatio = ratio;
					}

					var current_ratio = this.currentRatio;

					$.each(this.affectedTags, function(elIndex, elValue){
						$(elValue).each(function(){
							var current_tag = $(this);
							current_tag.css('font-size', (current_tag.data('originalSize')*(current_ratio/100))+current_tag.data('originalUnit'));
						});
					});
				},
				changeContrast: function(){
					var isNormalContrast = this.normalContrast;
					$.each(this.affectedTags, function(elIndex, elValue){
						$(elValue).each(function(){
							var current_tag = $(this);

							if(!isNormalContrast){
								current_tag.css('background-color', '');
								current_tag.css('color', '');
							} else {
								current_tag.css('background-color', '#000');
								current_tag.css('color', '#fff');
							}
						});
					});

					$(this.options.container).css('background-color', (!isNormalContrast) ? $(this.options.container).data('originalBackground') : '#000');
					$(this.options.container).css('color', (!isNormalContrast) ? $(this.options.container).data('originalColor') : '#fff');

					this.normalContrast = !this.normalContrast;
				},
				startPlugin: function(option){
					this.mergeOptions(option);
					this.fetchTags();
					this.storeDefaults();
					this.createDefaultMarkup();
					this.setActions();
				},
				executeFunction: function(function_name, value){
					switch(function_name){
						case 'decrease':
								this.decreaseFont();
							break;
						case 'reset':
								this.resetFont();
							break;
						case 'increase':
								this.increaseFont();
							break;
						case 'contrast':
								if(typeof value != 'undefined'){
									/* Change to specified value - true or false */
									if(value){
										/* Setting true, contrast will be applied */
										this.normalContrast = true;
									} else {
										/* Setting false, will remove contrast */
										this.normalContrast = false;
									}
								}

								this.changeContrast();
							break;
						case 'setRatio':
								this.changeFontSize(ratio);
							break;
						default:
								alert("Called function does not exist!");
							break;
					}
				},
				destroy: function(){
					/* Back all fonts to default size */
					this.resetFont();

					/* Remove contrast change */
					this.normalContrast = false;
					this.changeContrast();

					/* Remove plugin data */
					selector.removeData('easyView');
				}
			};

			plugin.startPlugin(option);

			/* Store plugin instance */
			selector.data('easyView', plugin);
		} else { 
			/* Plugin is already initialized, execute existing function */
			var plugin = selector.data('easyView');
			if(typeof option == 'object'){
				/* Restart plugin */
				plugin.destroy();
				plugin.startPlugin(option);
			} else if(typeof option == 'string') {
				/* Execute specific function */
				plugin.executeFunction(option, value);
			} else {
				alert("Invalid params to start");
			}
		}
	}
}(jQuery));