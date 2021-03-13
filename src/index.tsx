import React from 'react';
import { render } from 'react-dom';
import { Button } from '@material-ui/core';

function App() {
    return <Button>Hello World</Button>;
}

const root = document.createElement('div');
root.id = 'qi';
document.body.prepend(root);

render(<App />, root);
