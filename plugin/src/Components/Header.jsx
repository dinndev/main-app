import React from 'react';

export default class Header extends React.Component{

  render() {
    return(
      <div id="cp-header">
        <div className="cp-avatar">
          <strong>AE</strong>
          {/* img_tag_here */}
        </div>
        <p className="cp-h-name">Albert Einstein</p>
        <i class="fa fa-ellipsis-h"></i>
      </div>
    )
  }
}