
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |touch-control/ |quatrefoil/ |respo.calcit/ |respo-ui.calcit/ |respo-markdown.calcit/ |quaternion/
      :type-slots $ {}
  :files $ {}
    'app.comp.container $ %{} 'FileEntry
      :defs $ {}
        'Projection $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstruct Projection
            :p0 $ :: 'List 'Number
            :scale 'Number
            :shadow $ :: 'List 'Number
            :x 'Number
            :y 'Number
          :examples $ []
          :schema $ :: 'StructDef
        'calc-unit-x-axis $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn calc-unit-x-axis (p)
            let[] (a b c) p $ v-scale
              [] (negate c) 0 a
              / 1 $ sqrt $ sum-squares a c
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'Number
            :return $ :: 'List 'Number
        'calc-unit-y-axis $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn calc-unit-y-axis (p)
            let[] (a b c) p $ v-scale
              [] (* -1 a b) (sum-squares a c) (* -1 b c)
              / 1 $ sqrt $ sum-squares (* a b) (sum-squares a c) (* b c)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] $ :: 'List 'Number
            :return $ :: 'List 'Number
        'comp-axis $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-axis ()
            line-segments $ {}
              :segments $ []
                [] ([] -100 0 0) ([] 100 0 0)
                [] ([] 0 -100 0) ([] 0 100 0)
                [] ([] 0 0 -100) ([] 0 0 100)
              :material style-line
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Shape)
            :args $ []
        'comp-container $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-container (store)
            let
                look-distance $ [] 20 30 -60
                screen-x $ calc-unit-x-axis look-distance
                screen-y $ calc-unit-y-axis look-distance
                s $ noted "|cone back scale" 0.5
                targets $ [] ([] 80 70 -90) (; 50 90 -70)
                projections $ map targets $ fn (p) (transform-3d p look-distance s)
                scaled 0.01
              scene ({})
                group
                  {}
                    :scale $ [] scaled scaled scaled
                    :position $ [] 0 0.9 -0.2
                  ambient-light $ {} $ :color 0x666666
                  comp-axis
                  noted "|look direction" $ line $ {}
                    :points $ [] (v-scale look-distance 5)
                      v-scale look-distance $ negate s
                    :material $ assoc style-line :color 0xaaaaee
                  noted "|look point" $ group ({})
                    sphere $ {} (:radius 1) (:position look-distance)
                      :material $ assoc style-point :color 0xffffaa
                    text $ {} (:text |C) (:size 0.8) (:depth 0.5)
                      :material $ assoc style-point :color 0xffffaa
                      :position $ v+ look-distance $ [] 1 0 1
                  group ({}) & $ map-indexed projections $ fn (idx pro) (comp-point-explain idx pro look-distance screen-x screen-y s)
                  comp-grid look-distance screen-x screen-y
                  group ({})
                    sphere $ {} (:radius 1) (:material style-point)
                    text $ {} (:text |O) (:material style-point) (:size 0.8) (:depth 0.5)
                      :position $ [] 1 0 1
                  if (not= s 0)
                    group ({})
                      sphere $ {} (:radius 1) (:material style-point)
                        :position $ v-scale look-distance $ negate s
                      text $ {} (:text |S) (:material style-point) (:size 0.8) (:depth 0.5)
                        :position $ v+
                          v-scale look-distance $ negate s
                          [] -1 -2 0
                  point-light $ {} (:color 0xffffff) (:intensity 1.4) (:distance 200)
                    :position $ [] 20 40 50
                  ; point-light $ {} (:color 0xffffff) (:intensity 2) (:distance 200)
                    :position $ [] 0 60 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Component)
            :args $ [] $ :: 'Map 'Tag 'Dynamic
        'comp-demo $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-demo ()
            group ({})
              box $ {} (:width 16) (:height 4) (:depth 6)
                :position $ [] -40 0 0
                :material $ {} (:kind :mesh-lambert) (:color 0x808080) (:opacity 0.6)
                :event $ {} $ :click
                  fn (e d!) (d! :demo nil)
              sphere $ {} (:radius 8)
                :position $ [] 10 0 0
                :material $ {} (:kind :mesh-lambert) (:opacity 0.6) (:color 0x9050c0)
                :event $ {} $ :click
                  fn (e d!) (d! :canvas nil)
              group ({})
                text $ {} (:text |Quatrefoil) (:size 4) (:height 2)
                  :position $ [] -30 0 20
                  :material $ {} (:kind :mesh-lambert) (:color 0xffcccc)
              sphere $ {} (:radius 4) (:emissive 0xffffff) (:metalness 0.8) (:color 0x00ff00) (:emissiveIntensity 1) (:roughness 0)
                :position $ [] -10 20 0
                :material $ {} (:kind :mesh-basic) (:color 0xffff55) (:opacity 0.8) (:transparent true)
                :event $ {} $ :click
                  fn (e d!) (d! :canvas nil)
              point-light $ {} (:color 0xffff55) (:intensity 2) (:distance 200)
                :position $ [] -10 20 0
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Component)
            :args $ []
        'comp-grid $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-grid (look-distance screen-x screen-y)
            let
                gap 20
              group ({})
                line-segments $ {} (:position look-distance)
                  :segments $ concat
                    map (range -5 6)
                      fn (i)
                        []
                          v+
                            v-scale screen-x $ * 5 gap
                            v-scale screen-y $ * 20 i
                          v+
                            v-scale screen-x $ * -5 gap
                            v-scale screen-y $ * 20 i
                    map (range -5 6)
                      fn (i)
                        []
                          v+
                            v-scale screen-y $ * 5 gap
                            v-scale screen-x $ * 20 i
                          v+
                            v-scale screen-y $ * -5 gap
                            v-scale screen-x $ * 20 i
                  :material $ {} (:kind :line-basic) (:color 0x6677aa) (:opacity 0.4) (:transparent true)
                line-segments $ {} (:position look-distance)
                  :segments $ []
                    []
                      v+ (v-scale screen-y -18) (v-scale screen-x 32)
                      v+ (v-scale screen-y 18) (v-scale screen-x 32)
                    []
                      v+ (v-scale screen-y -18) (v-scale screen-x -32)
                      v+ (v-scale screen-y 18) (v-scale screen-x -32)
                    []
                      v+ (v-scale screen-y -18) (v-scale screen-x 32)
                      v+ (v-scale screen-y -18) (v-scale screen-x -32)
                    []
                      v+ (v-scale screen-y 18) (v-scale screen-x 32)
                      v+ (v-scale screen-y 18) (v-scale screen-x -32)
                  :material $ {} (:kind :line-basic) (:color 0xaaaa88) (:opacity 0.9) (:transparent true)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Shape)
            :args $ [] (:: 'List 'Number) (:: 'List 'Number) (:: 'List 'Number)
        'comp-point-explain $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn comp-point-explain (idx pro look-distance screen-x screen-y s)
            let
                point-on-screen $ let[] (x y) (:shadow pro)
                  v+ look-distance $ v+ (v-scale screen-x x) (v-scale screen-y y)
                screen-near $ v+ look-distance $ v-scale screen-x (:x pro)
              group ({})
                sphere $ {} (:radius 1)
                  :material $ assoc style-point :color 0xffffff
                  :position $ :p0 pro
                text $ {} (:material style-point) (:size 1.2) (:depth 0.5)
                  :text $ point-label "|P " idx
                  :position $ v+ (:p0 pro) ([] 2 0 1)
                line $ {}
                  :points $ [] (:p0 pro)
                    v-scale look-distance $ negate s
                  :material $ assoc style-line :color 0xeeaaff
                group ({})
                  sphere $ {} (:radius 2) (:material style-point) (:position point-on-screen)
                  text $ {} (:material style-point) (:size 1.2) (:depth 0.5)
                    :text $ point-label "|P' " idx
                    :position $ v+ point-on-screen $ [] 2 0 1
                  line $ {}
                    :points $ [] point-on-screen look-distance
                    :material $ assoc style-line :color 0x555533
                  line $ {}
                    :points $ [] (:p0 pro)
                      v-scale look-distance $ :scale pro
                    :material $ assoc style-line :color 0x555533
                  sphere $ {} (:radius 1) (:material style-point)
                    :position $ v-scale look-distance $ :scale pro
                  text $ {} (:material style-point) (:size 1.2) (:depth 0.5)
                    :text $ point-label "|Q " idx
                    :position $ v+
                      v-scale look-distance $ :scale pro
                      [] 2 0 1
                group ({})
                  mesh-line $ {}
                    :points $ [] look-distance screen-near
                    :material style-bold-line
                  sphere $ {} (:radius 1) (:material style-point) (:position screen-near)
                  text $ {} (:material style-point) (:size 0.8) (:depth 0.5)
                    :text $ point-label "|B " idx
                    :position $ v+ screen-near $ [] 1 0 1
                  mesh-line $ {}
                    :points $ [] point-on-screen screen-near
                    :material style-bold-line
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'quatrefoil.schema/Shape)
            :args $ [] 'Number 'app.comp.container/Projection (:: 'List 'Number) (:: 'List 'Number) (:: 'List 'Number) 'Number
        'point-label $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn point-label (t idx)
            if (> idx 0) (str t "| " idx) t
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'String)
            :args $ [] 'String 'Number
        'square $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn square (x) (pow x 2)
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Number)
            :args $ [] 'Number
        'style-bold-line $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-bold-line
            {} (:kind :mesh-line) (:color 0xaaaaff) (:transparent true) (:opacity 0.6) (:depthTest true) (:lineWidth 0.3)
          :examples $ []
          :schema $ :: 'Dynamic
        'style-line $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-line
            {} (:kind :line-basic) (:color 0x5555aa) (:opacity 0.9) (:transparent true)
          :examples $ []
          :schema $ :: 'Dynamic
        'style-point $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def style-point
            {} (:kind :mesh-lambert) (:color 0x808080) (:opacity 0.9)
          :examples $ []
          :schema $ :: 'Dynamic
        'sum-squares $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn sum-squares (& xs)
            -> xs (map square) (reduce 0 &+)
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Number) (:return 'Number)
            :args $ []
        'transform-3d $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn transform-3d (point look-distance s)
            let[] (x y z) point $ let[] (a b c) look-distance $ let
                r $ /
                  + (* a x) (* b y) (* c z)
                  + (square a) (square b) (square c)
                q $ / (+ s 1) (+ r s)
                L1 $ sqrt $ + (* a a b b)
                  square $ sum-squares a c
                  * b b c c
                y' $ *
                  /
                    + (* q y) (* b q s) (* -1 b s) (* -1 b)
                    sum-squares a c
                  , L1
                x' $ *
                  /
                    -
                      + (* q x) (* a q s) (* -1 s a) (* -1 a)
                      * y' $ / (* -1 a b) L1
                    , c -1
                  sqrt $ sum-squares a c
                z' $ negate r
              Projection :p0 point :scale r :shadow ([] x' y' z') :x x' :y y'
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'app.comp.container/Projection)
            :args $ [] (:: 'List 'Number) (:: 'List 'Number) 'Number
        'v+ $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn v+ (p q)
            let[] (x y z) p $ let[] (a b c) q $ match
              qv/v+ (qv/v3 x y z) (qv/v3 a b c)
              (:v3 u v w) ([] u v w)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) (:: 'List 'Number)
            :return $ :: 'List 'Number
        'v-scale $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn v-scale (point n)
            let[] (x y z) point $ match
              qv/v-scale (qv/v3 x y z) n
              (:v3 a b c) ([] a b c)
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'List 'Number) 'Number
            :return $ :: 'List 'Number
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.container
          :require
            quatrefoil.alias :refer $ group box sphere point-light ambient-light perspective-camera scene text line line-segments mesh-line
            quatrefoil.core :refer $ defcomp >>
            quaternion.vector :as qv
    'app.comp.nav $ %{} 'FileEntry
      :defs $ {}
        'comp-nav $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defcomp comp-nav (store states)
            let
                cursor $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                  .unwrap-or (get states :cursor) ([])
                  :: 'List 'Tag
                state $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                  or
                    .unwrap-or (get states :data) nil
                    {} $ :menu? false
                  :: 'Map 'Tag 'Dynamic
                menu? $ quatrefoil.util.core/require-decoded $ try-decode-map-as
                  .unwrap-or (get state :menu?) false
                  , 'Bool
              div
                {} $ :class-name css-nav
                a $ {} (:inner-text |Menu) (:class-name css/link)
                  :on-click $ fn (e d!)
                    hint-fn $ {} (:return 'Unit)
                      :args $ [] (:: 'Map 'Tag 'Dynamic)
                        :: 'Fn $ {}
                          :args $ [] 'Enum
                          :return 'Unit
                    d! $ :: :states cursor $ assoc state :menu? (not menu?)
                    , &unit
                if menu? $ div
                  {} $ :class-name css-pop-menu
                  =< nil 24
                  comp-md-block (load-content |explain.md) ({})
                  =< nil 120
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'respo.schema/Component)
            :args $ [] (:: 'Map 'Tag 'Dynamic) (:: 'Map 'Dynamic 'Dynamic)
        'css-nav $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-nav
            {} $ |$0 $ merge ui/global
              {} (:color :white) (:position :absolute) (:top 0) (:left 0)
          :examples $ []
          :schema $ :: 'Dynamic
        'css-pop-menu $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defstyle css-pop-menu
            {} $ |$0 $ {} (:max-height |90vh) (:border-radius |6px) (:padding "|8px 8px") (:z-index 900) (:position :fixed) (:left 8) (:top 32) (:overflow :auto)
              :color $ hsl 0 0 30
              :background-color $ hsl 0 0 100 $ Option :some 0.9
          :examples $ []
          :schema $ :: 'Dynamic
        'load-content $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro load-content (file)
            read-file $ str |docs/ file
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{} :fs-read
            :expansion $ :: 'Expr 'String
            :required $ [] 'Syntax
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.comp.nav
          :require (respo-ui.core :as ui)
            respo-ui.core :refer $ hsl
            respo.core :refer $ defcomp div a
            respo.css :refer $ defstyle
            respo.comp.space :refer $ =<
            respo-ui.css :as css
            respo-md.comp.md :refer $ comp-md-block
    'app.config $ %{} 'FileEntry
      :defs $ {} $ 'dev?
        %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $ .unwrap-or (get-env |mode) |release
          :examples $ []
          :schema $ :: 'Bool
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *store
            {} $ :states $ {}
              :cursor $ []
          :examples $ []
          :schema $ :: 'Ref $ :: 'Map 'Tag 'Dynamic
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op & payload)
            let
                data $ .unwrap-or (.first payload) nil
              cond
                  list? op
                  reset! *store $ updater @*store :states $ [] op data
                (tag? op)
                  reset! *store $ updater @*store op data
                (enum? op)
                  match op
                    (:states cursor state)
                      reset! *store $ updater @*store :states $ [] cursor state
                    _ $ reset! *store @*store
                true $ reset! *store @*store
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:rest 'Dynamic) (:return 'Unit)
            :args $ [] 'Dynamic
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! ()
            when dev? (load-console-formatter!) (println "|Run in dev mode")
            set-perspective-camera! $ {} (:fov 45)
              :aspect $ / (js-ffi.contract/expect-number |window.innerWidth js/window.innerWidth) (js-ffi.contract/expect-number |window.innerHeight js/window.innerHeight)
              :near 0.1
              :far 1000
              :position $ [] 0 0 100
            inject-tree-methods
            let
                canvas-el $ js/document.querySelector |canvas
              init-renderer! canvas-el $ {} $ :background 0x110022
            render-app!
            add-watch! *store :changes $ fn (store prev) (render-app!)
            set! js/window.onkeydown handle-key-event
            render-control!
            handle-control-events
            init-controls!
            println "|App started!"
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target
            .unwrap $ respo.ffi.browser/query-selector |.page
          :examples $ []
          :schema $ :: 'respo.dom/DomElement
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (non-nil? build-errors) (hud! |error build-errors)
              do (hud! |ok~ nil) (clear-cache!) (clear-control-loop!) (handle-control-events) (respo/clear-cache!) (remove-watch! *store :changes)
                add-watch! *store :changes $ fn (store prev) (render-app!)
                render-app!
                set! js/window.onkeydown handle-key-event
                println "|Code updated."
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! () (; println "|Render app:")
            render-canvas! (comp-container @*store) dispatch!
            respo/render! mount-target
              comp-nav @*store $ >>
                .unwrap $ get @*store :states
                , :dom
              , dispatch!
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            |@quatrefoil/utils :refer $ inject-tree-methods
            quatrefoil.core :refer $ render-canvas! init-controls! *global-tree clear-cache! init-renderer! handle-key-event handle-control-events
            app.comp.container :refer $ comp-container
            app.updater :refer $ updater
            |three :as THREE
            touch-control.core :refer $ render-control! start-control-loop! clear-control-loop!
            |bottom-tip :default hud!
            |./calcit.build-errors :default build-errors
            app.config :refer $ dev?
            quatrefoil.dsl.object3d-dom :refer $ set-perspective-camera!
            respo.core :as respo
            respo.core :refer $ defcomp defeffect <> >> div button textarea span input
            app.comp.nav :refer $ comp-nav
    'app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op op-data)
            if (= op :states) (update-states store op-data) store
          :examples $ []
          :schema $ :: 'Fn $ {}
            :args $ [] (:: 'Map 'Tag 'Dynamic) 'Tag 'Dynamic
            :return $ :: 'Map 'Tag 'Dynamic
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require $ quatrefoil.cursor :refer $ update-states
