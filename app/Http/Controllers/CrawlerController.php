<?php

namespace App\Http\Controllers;
use PHPHtmlParser\Dom;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
// use DB;
use Illuminate\Support\Facades\DB;
use DOMDocument;
use DOMXPath;

class CrawlerController extends Controller
{
    public function getspinneysParentCategories(){
        $langs                               = ['en', 'ar'];
        if(DB::table('categories')->count() >= 1){
            die('Categories have been crawled already - <a href="getSubCategories">Go to sub categories crawler</a>');
        }
        foreach($langs as $lang){
            $basic_url                        = 'https://spinneys-egypt.com/'.$lang;
            $dom                             = new Dom;
            $dom->loadFromUrl($basic_url);
            $categories                      = $dom->find('.py-1.mx-1.cat-ico.d-inline-flex.justify-content-center.align-items-center');

            foreach($categories as $key => $category){
                $category_name               = $category->getAttribute('data-original-title');
                $category_link               = $category->getAttribute('href');
                $category_link_without_lang  = explode($lang, $category_link)[1];
                if($lang == 'en'){
                        DB::table('categories')->insert(
                        [
                            'name_en'          => $category_name,
                            'url'             => $category_link
                        ]);
                }
                if($lang == 'ar'){
                    DB::table('categories')->where('url', 'like', '%'.$category_link_without_lang.'%')->update(['name_ar' => $category_name]);
                }
            }
        }
    }
    public function getspinneysSubCategories(){
        $langs                               = ['en', 'ar'];
        if(DB::table('sub_categories')->count() >= 1){
            die('Categories have been crawled already - <a href="getSubCategories">Go to sub categories crawler</a>');
        }
        $categories                          = DB::table('categories')->get();

        $all_subs                        = [];
        foreach($categories as $category){
            $dom                             = new Dom;
            $dom->loadFromFile($category->url);
            $sub_categories                  = $dom->find('.row.flex-wrap.justify-content-start.px-3.d-flex.align-items-start.text-capitalize');
            foreach($sub_categories as $sub_category){
                $sub_anchors                 = $sub_category->find('a');
                foreach($sub_anchors as $sub_anchor){
                    $sub_anchor_link         = $sub_anchor->getAttribute('data-href');
                    $sub_anchor_name         = $sub_anchor->text;

                    // $numb_of_products        = $dom->find('.page-item.as')->count() * 60;
                    if(trim(strtolower($sub_anchor_name)) != 'all'){
                        array_push($all_subs,
                        [
                            'name_en'                   => $sub_anchor_name,
                            'url'                       => $sub_anchor_link,
                            'parent_id'                 => $category->id,
                            // 'numb_of_products'          => 60,
                            'captured_products'         => 0,
                            'is_active'                 => 1
                        ]);
                    }
                }
            }
        }
        DB::table('sub_categories')->insert($all_subs);
        $all_sub_categories                         = DB::table('sub_categories')->whereNull('name_ar')->get();
        // dd($all_sub_categories);
        $base_url                                   = "https://spinneys-egypt.com/";
        foreach($all_sub_categories as $sub_category){
            $url                                    = $sub_category->url;
            $exploded                               = explode('/en/', $url);
            // dd($exploded);
            $ar_url                                 = $base_url.'/ar/'.$exploded[1];
            $ar_dom                                 = new Dom;
            $ar_dom->loadFromFile($ar_url);
            $ar_name                                = $ar_dom->find('.h2.eh-3.mt-0.dark.col-lg-4');
            DB::table('sub_categories')->where('id', $sub_category->id)->update(['name_ar' => trim($ar_name->text)]);

        }
    }

    public function getSpinneysProductsByCategory(){
        // categories
        $categories                         = DB::table('sub_categories')->where('is_active', 1)->get();
        // create a dom
        $dom                                = new Dom;
        $num_of_products                    = 0;
        $products_per_page                  = 60;

        foreach($categories as $category){
            // update num of products
            $dom->loadFromFile($category->url);
            $pagination                     = $dom->find('.d-flex.justify-content-end.mb-3.pagination.w-100');
            if(!isset($pagination)){
                $num_of_pages               = $dom->find('.page-item')->count();
                $num_of_products            = ($num_of_pages - 2) * $products_per_page;
            }
            else{
                $num_of_products            = $dom->find('.sp-product')->count();
            }
            DB::table('sub_categories')->where('id', $category->id)->update(['num_of_products' => $num_of_products]);

            $products                       = $dom->find('.sp-product');
            // this should be captured products and  % by 60 and get the output in ?page=%
            // if($category->num_of_products > $products->count()){
            //     $new_dom                    = new Dom;
            //     $new_dom->loadFromFile($category->url.'?page=2');
            //     dd($new_dom->find('.sp-product')->count());

            // }
            $products_array                             = [];
            foreach($products as $product){
            $exists                                     = DB::table('products')->where('product_id', $product->getAttribute('productid'))->first();
                if($exists){
                    continue;
                }
                $details                                = $product->find('.details');
                $anchor                                 = $details->find('a')->getAttribute('href');
                $product_name                           = $details->find('.h4.text-capitalize.mb-0')->text;
                // $arabic_dom_url                         = explode('/en/', $product->find('.imgwrap')->getAttribute('href'));
                // $arabic_dom_url                         = implode('/ar/', $arabic_dom_url);
                // $arabic_dom                             = new Dom;
                // $arabic_dom->loadFromFile($arabic_dom_url);
                // $product_name_ar                        = $arabic_dom->find('.h4.text-capitalize.mb-0')->text;
                $product_price                          = $product->find('meta[itemprop=price]')->getAttribute('content');
                // dd($details);
                if($product->find('.discount')[0] != null){
                    $product_details['dicounted_price'] = explode(' ', trim($product->find('.priceBefore.regular-price')->text))[1];
                }
                $product_details                        =  [];
                $product_details['name_en']             = trim($product_name);
                // $product_details['name_ar']             = $product_name_ar;
                $product_details['category_name_en']    = $category->name_en;
                $product_details['category_name_ar']    = $category->name_ar;
                $product_details['price']               = (double) $product_price;
                $product_details['image_url']           = $product->find('img')->getAttribute('data-src');
                $product_details['product_id']          = $product->getAttribute('productid');
                $product_details['spyn_url']            = $product->find('.imgwrap')->getAttribute('href');

                $product_dom                            = new Dom;
                $product_dom->loadFromUrl($product_details['spyn_url']);
                $product_details['unit']                = $product_dom->find('.unit_measure')[0] != null ? trim($product_dom->find('.unit_measure')->text) : null;
                // dd($product_dom->find('.moreDesc')->find('p')->text);
                $description                            = $product_dom->find('.moreDesc')->find('p');
                $product_details['description']         = $description[0] != null ? trim($description->text) :trim($product_dom->find('.moreDesc')->text);
                $product_details['product_id']          = $product->getAttribute('productid');
                // $product_images                         = $product_dom->find('.swiper-slide')->find('img');
                // // dd($product_images);
                // $images                                 = [];
                // foreach($product_images as $product_image){
                //     $string  = $product_image->getAttribute('data-src');
                //     preg_match_all('/\d+/', $string, $matches);
                //     $image   = $product_image->getAttribute('data-src');
                //     if($matches[0] == $product_details['product_id']){
                //         array_push($images, $image);
                //     }
                // }
                // $product_details['photos']              = implode(',', $images);
                array_push($products_array, $product_details);
                // dd($product->getAttribute('productid'));
                DB::table('sub_categories')->where('id', $category->id)->increment('captured_products');
                $captured_products                      = DB::table('sub_categories')->where('id', $category->id)->first()->captured_products;
                $number_of_products                     = DB::table('sub_categories')->where('id', $category->id)->first()->num_of_products;
                if($captured_products == $number_of_products){
                    DB::table('sub_categories')->where('id', $category->id)->update(['is_active'=> 0]);
                    $next_category                      = DB::table('sub_categories')->where('id', '>', $category->id)->orderBy('id')->first();
                    if($next_category){
                        DB::table('sub_categories')->where('id',  $next_category->id)->update(['is_active' => 1]);
                    }
                }
                // dd($product_details);
            }
            DB::table('products')->insert($products_array);
            return 'ok';
        }
    }

    public function update_arabic_products(){
        // dd('ss');
        $products                                   = DB::table('products')->where('name_ar', NULL)->take(10)->get();
        $dom                                        = new Dom;
        $products_array                             = [];
        foreach($products as $product){
            $rename                                 = str_replace('com/en', 'com/ar', $product->spyn_url);
            $dom->loadFromFile($rename);
            $name                                   = $dom->find('.mt-0.title.h3')->text;
            // For updating arabic description
            $description                            = $dom->find('.moreDesc')->find('p');
            $description_ar                         = $description[0] != null ? $description->text : $dom->find('.moreDesc')->text;
            // dd($name->text);
            // dd($description_ar);
            DB::table('products')->where('id', $product->id)->update([
                'name_ar'           => $name,
                'description_ar'    => $description_ar
            ]);
        }
        // dd($products_array);
        // DB::table('products')->insert($products_array);
        return 'done';
    }
    public function getspinneysProducts(){
        $lang                               = 'en';
        $baseURL                            = 'https://spinneys-egypt.com/'.$lang.'/'.'categories/bakery';
        $dom                                = new Dom;
        $dom->loadFromUrl($baseURL);
        // $products_container                 = $dom->find('.products_container');
        // $products                           = $products_container->getChildren();
        $products                           = $dom->find('.sp-product');
        // dd($products);
        $products_array                     = [];
        foreach($products as $product){
            // dd($product);
            // $products_array[]               = $product->getAttribute('productid');
            $details                            = $product->find('.details');
            $anchor                             = $details->find('a')->getAttribute('href');
            $product_name                       = $details->find('.h4.text-capitalize.mb-0')->text;
            $product_price                      = $product->find('.product-price')->find('.colored.priceAfter.mb-0.mr-2')->text;
            // dd($details);
            $product_details                    = (object) [];
            $product_details->name              = $product_name;
            $product_details->price             = $product_price;
            $product_details->image             = $product->find('img')->getAttribute('data-src');
            $product_details->id                = $product->getAttribute('productid');
            $product_details->link              = $product->find('.imgwrap')->getAttribute('href');

            $product_dom                        = new Dom;
            $product_dom->loadFromUrl($product_details->link);
            $product_details->unit              = $product_dom->find('.unit_measure')->text;
            // dd($product_dom->find('.moreDesc')->find('p')->text);
            $description                        = $product_dom->find('.moreDesc')->find('p');
            if(isset($description->text)){
                $description                    = $description->text;
            }
            else{
                $description                    = '';
            }
            // dd($description->text);
            $product_details->description       = $description;
            array_push($products_array, $product_details);
            // dd($product->getAttribute('productid'));
        }
        dd($products_array);
    }
    public function getProducts(){
        // dd('ss');
        $sub_category                       = DB::table('jumia_sub_categories')->where(['is_active' => 1,'done' => 0])->first();
        $sku_attr                           = 'data-simplesku';
        $brand_attr                         = 'data-brand';
        if($sub_category){
            // Sub category data
            // dd($sub_category);
            $category_id                    = $sub_category->category_id;
            $sub_category_id                = $sub_category->id;
            $sub_category_name              = $sub_category->name_en;
            $products_count                 = $sub_category->products_count;
            $sub_category_url               = $sub_category->url;
            // Category data
            $category                       = DB::table('jumia_categories')->where('id','=',$category_id)->first();
            // Dummy products page for the development
            // $sub_category_url               = 'http://localhost/jumia_products_page/index.html'; // Comment me on production
            $crawled                        = $sub_category->crawled;

            // One sub category crawled in raw here
            $dom                                        = new Dom;
            $dom->loadFromFile($sub_category_url);
            $x                                          = 0;
            $products_listing                           = $dom->find('article');
            $page_products_list                         = [];
            foreach($products_listing as $one_product_listing){
                $one_product_listing                    = $one_product_listing;
                $final_single_product                   = [];
                if($one_product_listing->getAttribute('class') == 'prd _fb col c-prd'){
                    // echo $one_product_listing;
                    // die('000000');
                    // echo $one_product_listing->getAttribute('class');
                    $single_product                     = $dom->find('a')[0];
                    $the_product_page_url               = $single_product->href;
                    // One product page for the development
                    // $the_product_page_url               = 'http://localhost/jumia_one_product_page/index.html'; // Comment me on production
                    $the_product_page                   = $dom->loadFromFile($the_product_page_url);
                    $dom4                               = new DOM;
                    $for_specs                          = $dom4->loadStr($the_product_page);


                    // Product crawled Data
                    $product_name                       = '';
                    $product_original_price             = 0;
                    $product_discounted_price           = 0;
                    $product_images_array               = [];
                    $product_desc_text                  = '';
                    $product_desc_list                  = [];
                    $product_sku                        = '';

                    // Process the main product section containing the important data
                    $product_inner_data                 = $the_product_page->find('section');
                    foreach($product_inner_data as $one_inner_section){
                        if($one_inner_section->getAttribute('class') == 'col12 -df -d-co'){
                            $product_inner_data         = $one_inner_section;
                            break;
                        }
                    }

                    // Product name
                    $product_page                           = $dom->loadStr($product_inner_data);
                    $product_name                           = $product_page->find('h1')[0];
                    $final_single_product['name']           = $product_name->innerHTML;
                    $final_single_product['added_by']       = 'admin';
                    $final_single_product['user_id']        = '9';

                    // Original Price
                    $product_original_price                 = $product_page->find('span');
                    foreach($product_original_price as $one_product_price_span){
                        if($one_product_price_span->getAttribute('class') == '-tal -gy5 -lthr -fs16'){
                            $product_original_price         = $one_product_price_span->innerHTML;
                            break;
                        }
                    }
                    $product_original_price                 = explode(' ',$product_original_price);
                    $final_single_product['unit_price']     = end($product_original_price);

                    // Discounted Price
                    $product_discounted_price               = $product_page->find('span');
                    foreach($product_discounted_price as $one_product_price_span){
                        if(strpos($one_product_price_span->getAttribute('class'),'-b -ltr -tal')){
                            $product_discounted_price       = $one_product_price_span->innerHTML;
                            break;
                        }
                    }
                    $product_discounted_price               = explode(' ',$product_discounted_price);
                    $product_discounted_price               = end($product_discounted_price);
                    $final_single_product['purchase_price'] = strip_tags($product_discounted_price);

                    // Images
                    $product_images                         = $product_page->find('div');
                    foreach($product_images as $one_inner_image_div){
                        if($one_inner_image_div->getAttribute('id') == 'imgs-crsl'){
                            $product_images                 = $one_inner_image_div->innerHTML;
                            break;
                        }
                    }
                    $product_images                         = $dom->loadStr($product_images);
                    $product_images                         = $product_images->find('img');
                    foreach($product_images as $one_image){
                        $image_url                          = $one_image->getAttribute('data-src');
                        $image_url                          = str_replace('150x150','600x600',$image_url);
                        $image_url                          = explode('?',$image_url);
                        $image_url                          = $image_url[0];
                        $image_extension                    = explode('.',$image_url);
                        $image_extension                    = end($image_extension);
                        $image_new_name                     = Str::random(14).'.'.$image_extension;
                        $image_content                      = file_get_contents($image_url);
                        // Save the image
                        if(Storage::disk('local')->put('products/'.$image_new_name, $image_content)){
                            $product_images_array[]         = $image_new_name;
                        }
                    }
                    $final_single_product['thumbnail_img']  = $product_images_array[0];
                    $final_single_product['photos']         = json_encode($product_images_array);


                    // Specs

                    // $product_desc_text                      = $for_specs->loadStr($product_inner_data);
                    $product_desc_text                      = $for_specs->find('div');
                    // echo $the_product_page;
                    $the_desc_lis                           = [];
                    foreach($product_desc_text as $one_desc){
                        if($one_desc->getAttribute('class') == 'markup -pam'){
                            $product_desc_text              = $one_desc;
                            break;
                        }
                    }
                    $product_desc_text_ul                   = $dom4->loadStr($product_desc_text);
                    $product_desc_text_ul                   = $product_desc_text_ul->find('li');
                    foreach($product_desc_text_ul as $one_internal_li){
                        $the_desc_lis[]                     = $one_internal_li->innerHTML;
                    }
                    $final_single_product['description']      = json_encode($the_desc_lis);

                    // SKU / Brand
                    $dom2                                   = new DOM;
                    $product_sku_x                          = $dom2->loadStr($product_inner_data);
                    $product_sku_x                          = $product_sku_x->find('form')[0];
                    $product_sku                            = $product_sku_x->$sku_attr;
                    $product_brand                          = $product_sku_x->$brand_attr;
                    $final_single_product['brand']          = $product_brand;
                    $final_single_product['sku']            = $product_sku;

                    $final_single_product['meta_title']     = $final_single_product['name'];
                    $final_single_product['meta_description']     = $final_single_product['name'].','.$final_single_product['brand'].','.$the_desc_lis[0].','.$final_single_product['sku'];
                    $final_single_product['attributes']     = $final_single_product['description'];
                    $final_single_product['published']      = '1';
                    $final_single_product['unit']           = 'item';
                    $final_single_product['created_at']     = date('Y-m-d H:i:s');
                    $final_single_product['updated_at']     = date('Y-m-d H:i:s');

                    if(DB::table('products')->insert($final_single_product)){
                        echo 'success'.PHP_EOL;
                        die('ss');
                    }
                    die('zz');
                }else{
                    unset($one_product_listing);
                }
                sleep(rand(1,8));
            }
            // End sub category raw

            DB::table('jumia_sub_categories')->where('id','=',$sub_category_id)->update(
                [
                    'crawled'               => (int)$crawled+40
                ]
            );


            $sub_category                   = DB::table('jumia_sub_categories')->where('id','=',$sub_category_id)->first();
            $sub_sub_category_id            = $sub_category->id;
            $name                           = $sub_category->name_en;
            $category_url                   = $sub_category->url;
            $crawled                        = $sub_category->crawled;


            if($crawled >= $products_count){
                DB::table('jumia_sub_categories')->where('id','!=',$sub_category_id)->where('done','!=',1)->limit(1)->update(
                    [
                        'is_active'                 => 1
                    ]
                );
                DB::table('jumia_sub_categories')->where('id','=',$sub_category_id)->update(
                    [
                        'is_active'                 => 0,
                        'done'                      => 1
                    ]
                );


            }

            print_r($sub_category);
        }else{
            $details = [
                'title' => 'Crawler Has Finished',
                'body' => 'Please check crawler as it has finished pulling data.'
            ];
            print_r($details);
            // \Mail::to('a.abdo23@hotmail.com')->send(new \App\Mail\MyTestMail($details));

        }
    }

    public function getCategories(){
        // Check if categories crawled
        if(DB::table('jumia_categories')->count() >= 1){
            die('Categories have been crawled already - <a href="getSubCategories">Go to sub categories crawler</a>');
        }
        $lang                   = 'ar';

        $bare_url               = 'https://www.jumia.com.eg/{lang}';
        $cats_url               = 'https://www.jumia.com.eg/'.$lang.'';
        $dom                    = new Dom;
        $dom->loadFromFile($cats_url);

        $cats                   = $dom->find('.flyout');
        $x                      = 0;
        $categories             = [];
        foreach($cats as $one){
            $x++;
            if($x < 1){
                continue;
            }
            $tag_role           = $one->getAttribute('role');
            $tag_class          = $one->getAttribute('class');
            $tag_id             = $one->getAttribute('id');
            $tag_inners         = $one->innerHTML;
            // echo $tag_inners;
            if($tag_role == 'menu'){
                $menu_to_dom    = $dom->loadStr($tag_inners);
                $links          = $menu_to_dom->find('a');
                foreach($links as $link){
                    $the_name   = $link->find('span')[0]->text;
                    $categories[]       = ['name_'.$lang => $the_name,'url' => $bare_url.$link->href,'created_at' => date('Y-m-d H:i:s'),'updated_at' => date('Y-m-d H:i:s')];
                }
            }
        }

        DB::table('jumia_categories')->insert($categories);

    }

    public function getSubCategories(){
        ini_set('max_execution_time',3000);
        if(DB::table('jumia_sub_categories')->count() >= 1){
            die('Sub Categories have been crawled already - <a href="getProducts">Go to products crawler</a>');
        }
        $lang                   = 'ar';
        $bare_url               = 'https://www.jumia.com.eg';

        $categories             = DB::table('jumia_categories')->get();
        foreach($categories as $one){
            $category_url           = str_replace('{lang}',$lang,$one->url);
            $dom                    = new Dom;
            $dom->loadFromFile($category_url);

            $cats                   = $dom->find('article');
            foreach($cats as $x){
                // Parse deeper
                $h2                 = $x->find('h2');
                $inners             = '';
                if(count($h2) >= 1){
                    $inners         = $x->innerHTML;
                    // echo count($articles_parsed);
                    // print_r($articles_parsed);
                    // echo PHP_EOL.'---------------------'.PHP_EOL;
                    break;
                }
            }
            $dom->loadStr($inners);
            $urls                   = $dom->find('a');
            $insertions             = [];
            foreach($urls as $one_url){
                $full_url           = $bare_url.$one_url->href;
                $dom->loadFromFile($full_url); // -gy5 -phs
                $counter            = $dom->find('p');
                foreach($counter as $one_counter){
                    if($one_counter->getAttribute('class') == '-gy5 -phs'){
                        $counter    = trim($one_counter->innerHTML);
                        // $counter    = (int)$counter;
                        break;
                    }
                }
                $counter            = explode(' ',$counter);
                $counter            = end($counter);
                $insertions[]       = [
                    'category_id'   => $one->id,
                    'name_ar'       => '',
                    'name_en'       => $one_url->innerHTML,
                    'url'           => $full_url,
                    'products_count'    => $counter
                ];
            }
            $x                      = 0;
            DB::table('jumia_sub_categories')->insert($insertions);
        }
        /*

        $sub_cats_url               = 'https://www.jumia.com.eg/'.$lang.'';
        $dom                    = new Dom;
        $dom->loadFromFile($sub_cats_url);

        $cats                   = $dom->find('.flyout');
        $x                      = 0;
        $categories             = [];
        foreach($cats as $one){
            $x++;
            if($x < 1){
                continue;
            }
            $tag_role           = $one->getAttribute('role');
            $tag_class          = $one->getAttribute('class');
            $tag_id             = $one->getAttribute('id');
            $tag_inners         = $one->innerHTML;
            // echo $tag_inners;
            if($tag_role == 'menu'){
                $menu_to_dom    = $dom->loadStr($tag_inners);
                $links          = $menu_to_dom->find('a');
                foreach($links as $link){
                    $the_name   = $link->find('span')[0]->text;
                    $categories[]       = ['name_'.$lang => $the_name,'url' => $cats_url.$link->href];
                }
            }
        }

        DB::table('jumia_sub_categories')->insert($categories); */
    }
    public function alo(){

        $lang                   = 'ar';

        $bare_url               = 'https://spinneys-egypt.com/ar/';
        // $cats_url               = 'https://www.jumia.com.eg/'.$lang.'';
        $dom                    = new Dom;
        $dom->loadFromFile($bare_url);

        $cats                               = $dom->find('.nav.navbar.px-3.py-0.align-items-stretch.justify-content-start.main-cats.mt-3.d-none.d-md-inline-flex');
        // dd($cats);
        $categories                 = [];
        foreach($cats as $cat){
            $anchors = $cat->find('a');
            foreach($anchors as $anchor){
                array_push($categories, ['link'=> $anchor->getAttribute('href'), 'name' => $anchor->getAttribute('data-original-title')]);

            }
        }
        $all = [];
        foreach($categories as $category){
            $link                           = $category['link'];
            $name                           = $category['name'];
            $categories_dom                 = new Dom;
            $categories_dom->loadFromFile($link);

            $sub_categories                 = $categories_dom->find('.row.flex-wrap.justify-content-start.px-3.d-flex.align-items-start.text-capitalize');
            $all_subs                   = [];
            foreach($sub_categories as $sub_category){
                $sub_anchors                = $sub_category->find('a');
                foreach($sub_anchors as $sub_anchor){
                    array_push($all_subs, $sub_anchor->text);
                }
            }
            array_push($all, ['parent'=> $name, 'sub_categorires' => $all_subs]);
        }
        // array_push($all, $categories);
        // Open a new CSV file for writing
        $csvFile = fopen('categoriesar.csv', 'w');
        fputs($csvFile, $bom =( chr(0xEF) . chr(0xBB) . chr(0xBF) ));
        // Write the header row to the CSV file
        fputcsv($csvFile, array('parent', 'child'));

        // Loop through the categories and write them to the CSV file
        foreach ($all as $category) {
            // dd($category);
            if(!empty($category['sub_categorires'])){
                foreach($category['sub_categorires'] as $key => $cat){
                    // dd($category[$key]);
                    fputcsv($csvFile, [$category['parent'], $cat]);
                }
            }
            else{
                fputcsv($csvFile, [$category['parent'], '']);
            }
        }

        // Close the CSV file
        fclose($csvFile);

        dd($all);
        return $categories;

    }
    public function aloha(){
        // Load the HTML content of the website
        $html = file_get_contents('https://aloha.com.eg/');
        // dd($html);
        // Create a new DOMDocument object
        $dom = new DOMDocument();

        // Disable libxml errors and warnings
        libxml_use_internal_errors(true);

        // Load the HTML content into the DOMDocument object
        $dom->loadHTML($html);

        // Create a new DOMXPath object
        $xpath = new DOMXPath($dom);

        // Get all the category links
        $categoryLinks = $xpath->query('//div[@class="menu"]');
        // $categoryLinks = $xpath->query('//div[@class="container menu"]/ul/li/a');
        // dd($categoryLinks);

        // Create an empty array to store the categories
        $categories = array();

        // Loop through the category links and extract the category names and images
        foreach ($categoryLinks as $categoryLink) {
            // Get the category name
            $categoryName = $categoryLink->nodeValue;
            // dd($categoryName);
            // Get the category image
            $categoryImage = '';
            $imageNode = $xpath->query('./img', $categoryLink);
            dd($imageNode);
            if ($imageNode->length > 0) {
                $categoryImage = $imageNode->item(0)->getAttribute('src');
            }

            // Add the category to the array
            $categories[] = array(
                'name' => $categoryName,
                'image' => $categoryImage
            );
        }

        // Open a new CSV file for writing
        $csvFile = fopen('categories.csv', 'w');

        // Write the header row to the CSV file
        fputcsv($csvFile, array('Name', 'Image'));

        // Loop through the categories and write them to the CSV file
        foreach ($categories as $category) {
            fputcsv($csvFile, $category);
        }

        // Close the CSV file
        fclose($csvFile);

        echo 'Categories and their images have been exported to categories.csv file.';

    }

}
