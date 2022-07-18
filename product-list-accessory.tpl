{if isset($products) && $products}
	<!-- Products list -->
	<ul style="height:150px;"{if isset($id) && $id} id="{$id}"{else} id="product_list"{/if} class="product_list grid row{if isset($class) && $class} {$class}{/if}">
		{foreach from=$products item=product name=products}
			<li class="ajax_block_product col-xs-12 col-sm-12 col-md-12" style="min-height:150px !important; heuight:150px !important;">
				<div class="product-container">
					<a href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
						<div class="left-block">
							{hook h='displayAttributes' product=$product}
							<div class="product-image-container">
								<img class="replace-2x img-responsive" src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} />
							</div>
						</div>
						<div class="right-block">
						<span class="product-name" href="{$product.link|escape:'html':'UTF-8'}" title="{$product.name|escape:'html':'UTF-8'}">
							{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}
							{$product.name|truncate:60:'...'|escape:'html':'UTF-8'}
						</span>
							{* {if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
								<div class="content_price">
									{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}
										{hook h="displayProductPriceBlock" product=$product type='before_price'}
										<span class="price product-price">
											<span class="unit-title">{l s='l\'unité'}</span> {if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}
											<span class="ht-price">{l s='(HT)'}</span>
										</span>
										{if $product.price_without_reduction > 0 && isset($product.specific_prices) && $product.specific_prices && isset($product.specific_prices.reduction) && $product.specific_prices.reduction > 0}
											{hook h="displayProductPriceBlock" product=$product type="old_price"}
											<span class="old-price product-price">
										{displayWtPrice p=$product.price_without_reduction}
									</span>
											{hook h="displayProductPriceBlock" id_product=$product.id_product type="old_price"}
											{if $product.specific_prices.reduction_type == 'percentage'}
												<span class="price-percent-reduction">-{$product.specific_prices.reduction * 100}%</span>
											{/if}
										{/if}
										{hook h="displayProductPriceBlock" product=$product type="price"}
										{hook h="displayProductPriceBlock" product=$product type="unit_price"}
										{hook h="displayProductPriceBlock" product=$product type='after_price'}
									{/if}
									<p class="qty-mini">{l s='Quantité mini x'}{if isset($product.axcolisage)}{$product.axcolisage}{elseif $product.unity}{$product.unity}{else}1{/if}</p>
								</div>
							{/if} *}
							{* <div class="button-container">
								{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}
									{if isset($product.axcolisage) && $product.axcolisage}
										{$qty_min = $product.axcolisage-1}
									{else}
										{$qty_min = 0}
									{/if}
									{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > $qty_min)}
										<p class="quantity_wanted_list">
											<a href="#" data-field-qty="qty" class="btn btn-default button-minus productlist_quantity_down" data-step="{if isset($product.axcolisage)}{$product.axcolisage}{else}1{/if}">
												<span><i class="icon-minus"></i></span>
											</a>
											<input type="text" name="ajax_qty_to_add_to_cart[{$product.id_product|intval}]"
												   id="quantity_wanted_{$product.id_product|intval}"
												   class="text"
												   value="{if isset($product.axcolisage)}{$product.axcolisage}{else}{if isset($quantityBackup)}{$quantityBackup|intval}{else}1{/if}{/if}"
												   size="2"
												   maxlength="3" />
											<a href="#" data-field-qty="qty" class="btn btn-default button-plus productlist_quantity_up" data-step="{if isset($product.axcolisage)}{$product.axcolisage}{else}1{/if}">
												<span><i class="icon-plus"></i></span>
											</a>
											<span class="clearfix"></span>
										</p>
										{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}
										<a class="button ajax_add_to_cart_button btn btn-blue" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">
											<span>{l s='Je commande'}</span>
										</a>
									{/if}
								{/if}
							</div> *}
							{*<div class="button-container">*}
								{*{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.customizable != 2 && !$PS_CATALOG_MODE}*}
									{*{if (!isset($product.customization_required) || !$product.customization_required) && ($product.allow_oosp || $product.quantity > 0)}*}
										{*{capture}add=1&amp;id_product={$product.id_product|intval}{if isset($product.id_product_attribute) && $product.id_product_attribute}&amp;ipa={$product.id_product_attribute|intval}{/if}{if isset($static_token)}&amp;token={$static_token}{/if}{/capture}*}
										{*<a class="button ajax_add_to_cart_button btn btn-blue" href="{$link->getPageLink('cart', true, NULL, $smarty.capture.default, false)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Add to cart'}" data-id-product-attribute="{$product.id_product_attribute|intval}" data-id-product="{$product.id_product|intval}" data-minimal_quantity="{if isset($product.product_attribute_minimal_quantity) && $product.product_attribute_minimal_quantity >= 1}{$product.product_attribute_minimal_quantity|intval}{else}{$product.minimal_quantity|intval}{/if}">*}
											{*<span>{l s='Je commande'}</span>*}
										{*</a>*}
									{*{else}*}
										{*<span class="button ajax_add_to_cart_button btn btn-blue disabled">*}
									{*<span>{l s='Je commande'}</span>*}
								{*</span>*}
									{*{/if}*}
								{*{/if}*}
							{*</div>*}
						</div>
					</a>
				</div><!-- .product-container> -->
			</li>
		{/foreach}
	</ul>
	{addJsDefL name=min_item}{l s='Please select at least one product' js=1}{/addJsDefL}
	{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
	{addJsDef comparator_max_item=$comparator_max_item}
	{addJsDef comparedProductsIds=$compared_products}
{/if}