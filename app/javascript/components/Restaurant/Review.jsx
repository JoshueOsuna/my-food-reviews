import React, {useState, Fragment} from 'react';
import styled from 'styled-components';
import Rating from '../Rating/Rating';
import Gray from './Stars/Gray';
import Hover from './Stars/Hover';
import Selected from './Stars/Selected';

const Card = styled.div`
  border: 1px solid rgba(0,0,0,0.1);
  border-radius: 4px;
  padding: 20px;
  margin: 0 20px 20px 0;
  position: relative;
`
const Title = styled.div`
  padding: 20px 0 0 0;
  font-size: 18px;
`
const Description = styled.div`
  padding: 0 0 20px 0;
  font-size: 14px;
`
const Options = styled.div`
  display: flex;
  flex-direction: row;
  position: absolute;
  right: 20px;
  top: 20px;
`
const Option = styled.div`
  padding-left: 10px;
  cursor: pointer;
  box-shadow: none;
  border-radius: 4px;
  margin: 0 px;
  i {
    font-size: 16px;
  }
`
const RatingBox = styled.div`
  background: #fff;
  display: flex;
  justify-content: center;
  flex-direction: row-reverse;
  position: relative;
  margin-top: 12px;

  input {
    display: none;
  }

  label {
    cursor: pointer;
    width: 40px;
    height: 40px;
    background-image: url("data:image/svg+xml;charset=UTF-8,${Gray}");
    background-repeat: no-repeat;
    background-position: center;
    background-size: 70%;
  }

  input:checked ~ label,
  input:checked ~ label ~ label {
    background-image: url("data:image/svg+xml;charset=UTF-8,${Selected}");
  }

  input:not(:checked) ~ label:hover,
  input:not(:checked) ~ label:hover ~ label {
    background-image: url("data:image/svg+xml;charset=UTF-8,${Hover}");
  }
`;

const Review = (props) => {
  const [review, setReview] = useState(props.attributes);
  const [isEditing, setIsEditing] = useState(false);

  const handleEdit = (e) => {
    e.preventDefault();

    setIsEditing(true);
  }

  const handleChange = (e) => {
    e.preventDefault();

    setReview(Object.assign({}, review, {[e.target.name]: e.target.value}))
  }

  const setRating = (score, e) => {
    e.preventDefault();
  
    setReview({ ...review, score });
  }

  const handleSubmit = (e) => {
    e.preventDefault();

    props.handleEdit(props.id, e, review);
    setIsEditing(false);
  }

  const ratingOptions = [5,4,3,2,1].map( (score, index) => {
  return ( 
    <Fragment key = {index}>
      <input 
        type="radio" value={score} name="rating" checked={review.score === score}
        onChange={() => console.log('selected:', score)} id={`rating-${score}`}
      />
      <label onClick = {setRating.bind(this, score)}></label>
    </Fragment> 
  )});

  return (
    <Card>
      {!isEditing ? (
        <div>
          <div className="rating-container">
            <Rating score={review.score} />
          </div>
          <Title>{review.title}</Title>
          <Description>{review.description}</Description>
          <Options>
            <Option onClick={handleEdit}>
              <i className="fa fa-edit"></i>
            </Option>
            <Option onClick={props.handleDestroy.bind(this, props.id)}>
              <i className="fa fa-trash"></i>
            </Option>
          </Options>
        </div>
      ) : (
        <form onSubmit={handleSubmit}>
          <RatingBox>
            {ratingOptions}
          </RatingBox>
          <Title>
            <input
              onChange={handleChange}
              value={review.title}
              type="text"
              name="title"
              placeholder="Review Title"
            />
          </Title>
          <Description>
            <input
              onChange={handleChange}
              value={review.description}
              type="text"
              name="description"
              placeholder="Review Description"
            />
          </Description>
          <Options>
            <Option as="button" type="submit">
              <i className="fa fa-save"></i>
            </Option>
          </Options>
        </form>
      )}
    </Card>
  );
};

export default Review;
