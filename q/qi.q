
// stores client events into a list
.qi.client_events: ()

// functions that get data for a component once rendered or on client side action
.qi.data_recivers: ()

// named functions that when called in q update client without a re-render
.qi.data_binders: ()!()

// client side page
.qi.page_layout: 0b

// create a client side element
// component -- `symbol | component -- target to render
// props -- dict | bool -- props or atributes, 0b for none
// children component | list[component] | string | bool -- children of this element, 0b for none
.qi.create_element: {[component;props;children]
    if[not type[component] in -11 -1h;'component_type];
    if[not type[props] in 99 -1h;'prop_type];
    // TODO check props for events, recivers and binders
    if[not type[children] in 0 10 -1h;'children_type];
    (component;props;children) }

.qi.reset: {
    .qi.client_events: ();
    .qi.data_recivers: ();
    .qi.data_binders: ()!();
    .qi.page_layout: 0b; }

.qi.page_layout: .qi.create_element[`h1;0b;"Hello World"]

// send data to client
// command -- symbol
// data -- anything
// returns if the data was sent
.qi.send: { [command;data]
    if [.z.w=0i;:0b];
    neg[.z.w] -8!(command;data);
    1b }

.qi.render: { .qi.send[`render;.qi.page_layout] }
