import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  padding: 50px 100px 50px 0;
  font-size: 30px;

  img: {
    height: 60px;
    width: 60px;
    border-radius: 100%;
    border: 1px solid rgba(0,0,0,0.1);
    margin-bottom: -8px;
  }
`
const TotalReviews = styled.div`
  font-size: 18px;
  padding: 10px 0;

`
const TotalOutOf = styled.div`
`

const Header = ( props ) => {
  const { name, image_url, average_score } = props.attributes;
  const total = props.reviews.length;
  return (
    <Wrapper>
      <h1><img src={image_url} alt={name} width="50" />{name}</h1>
      <TotalReviews>{total} User Reviews</TotalReviews>
      <div className="starRating"></div>
      <TotalOutOf>{average_score} out of 5</TotalOutOf>
    </Wrapper>
  )
};

export default Header;
