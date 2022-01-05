import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
  return (
    <div>
      Esta es otra página!
      <Link to="/">Go back home</Link>
    </div>
  );
};
